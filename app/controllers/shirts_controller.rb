class ShirtsController < ApplicationController

  before_action :set_shirt, only: [:show, :edit, :update, :destroy]

  def index
    @shirts = Shirt.all
  end

  def search
    collar = get_param(:size_collar)
    bust = get_param(:size_bust)
    waist = get_param(:size_waist)
    arm = get_param(:size_arm)
    label = get_param(:label)

    search_param = find_applicable_params(collar, bust, waist, arm, label)
    ordering_param = 'shirts.size_collar ASC, shirts.size_bust ASC, shirts.size_waist ASC'
    @shirts = find_shirts(search_param, ordering_param)

    10.times do |increase|
      if @shirts.count < 4
        search_param[:size_bust] = (bust .. bust + increase + 1) unless bust == 0
        search_param[:size_waist] = (waist .. waist + increase + 1) unless waist == 0
        @shirts = find_shirts(search_param, ordering_param)
      end
    end

    if @shirts.count < 4
      search_param[:size_collar] = ( collar .. collar + 1 ) unless collar == 0
      search_param[:size_arm] = ( arm - 1 .. arm + 1 ) unless arm == 0
      @shirts = find_shirts(search_param, ordering_param)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shirts }
    end
  end

  def show
    Shirt.find_by(code: params[:code])
  end

  def new
  end

  def edit
    if current_user.present?
      Shirt.find_by(code: params[:code])
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

    def find_shirts(search_param, ordering_param)
      Shirt.where(:shirts => search_param).order(ordering_param)
    end

    def set_shirt
      @shirt = Shirt.find_by_code(params[:id])
    end

    def shirt_params
      params.require(:shirt).permit(
          :code, :label, :description, :ean, :profile,
          :collar, :breast_pocket, :wristband, :color,
          :cloth, :price, :link, :affiliate, :picture,
          :size_collar, :size_bust, :size_waist, :size_body,
          :size_arm, :size_shoulder, :size_back, :size_wrist,
          :sleeve) if params[:shirt]
    end

end
