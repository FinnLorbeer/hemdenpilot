require 'pry'

class ShirtsController < ApplicationController

  before_action :set_shirt, only: [:show, :edit, :update, :destroy]

  def index
    @shirts = Shirt.all
  end

  def search
    label = params[:label].to_s.sub("{\"id\"=>\"", "").chomp("\"}")

    collar = params[:size_collar].to_i
    bust = params[:size_bust].to_i
    waist = params[:size_waist].to_i
    arm = params[:size_arm].to_i

    shirts = {}
    shirts[:size_collar] = collar unless collar == 0
    shirts[:size_bust] =  bust unless bust == 0
    shirts[:size_waist] = waist unless waist == 0
    shirts[:size_arm] =  arm unless arm == 0
    shirts[:label] = label unless label == ''

    ordering_param = "shirts.size_collar ASC, shirts.size_bust ASC, shirts.size_waist ASC"

    @shirts = Shirt.where(:shirts => shirts).order(ordering_param)

    3.times do |increase|
      if @shirts.empty?
        shirts[:size_bust] = (bust .. bust + increase + 1) unless bust == 0
        shirts[:size_waist] = (waist .. waist + increase + 1) unless waist == 0
        @shirts = Shirt.where(:shirts => shirts).order(ordering_param)
      end
    end

    if @shirts.empty?
      shirts[:size_collar] = (collar .. collar + 1 ) unless collar == 0
      shirts[:size_arm] = (arm -1 .. arm + 1 ) unless arm == 0
      @shirts = Shirt.where(:shirts => shirts).order(ordering_param)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shirts }
    end
  end

  def show
    edit_shirt = Shirt.find_by(code: params[:code])
  end

  def new
  end

  def edit
    if current_user.present?
      shirt = Shirt.find_by(code: params[:code])
      render 'edit'
    else
      render 'show'
    end
  end

  def create
    @shirt = Shirt.new(shirt_params)

    respond_to do |format|
      if @shirt.save
        format.html { redirect_to @shirt, notice: 'Shirt was successfully created.' }
        format.json { render action: 'show', status: :created, location: @shirt }
      else
        format.html { render action: 'new' }
        format.json { render json: @shirt.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @shirt.update(shirt_params)
        format.html { render action: 'edit' }
        format.json { head :no_content }
        flash.now[:success] = 'Update des Hemdes erfolgreich - yay!'
      else
        format.html { render action: 'edit' }
        format.json { render json: @shirt.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shirt.destroy
    respond_to do |format|
      format.html { redirect_to shirts_url }
      format.json { head :no_content }
    end
  end

  private

    def set_shirt
      @shirt = Shirt.find_by_code(params[:id])
    end

    def shirt_params
      params.require(:shirt).permit(:code, :label, :description, :ean, :profile, :collar, :breast_pocket, :wristband, :color, :cloth, :price, :link, :affiliate, :picture, :size_collar, :size_bust, :size_waist, :size_body, :size_arm, :size_shoulder, :size_back, :size_wrist, :sleeve) if params[:shirt]
    end

end
