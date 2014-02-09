class ShirtsController < ApplicationController
  before_action :set_shirt, only: [:show, :edit, :update, :destroy]

  def index
    @shirts = Shirt.all
  end
  
  def search
    collar_index = bust_index = waist_index = arm_index = search_run_indexer = 0

    while search_run_indexer < 30 do
      @shirts = Shirt.where(:size_collar => range(params[:size_collar], collar_index, false), :size_bust => range(params[:size_bust], bust_index, false), :size_waist => range(params[:size_waist], waist_index, false), :size_arm => range(params[:size_arm], arm_index, true)).limit(50)
      search_run_indexer += 1
      bust_index += 1
      waist_index += 1
      arm_index += 1
        
      if search_run_indexer == 10
        collar_index = 1
        bust_index = waist_index = arm_index = 0
      end
        
      if search_run_indexer == 20
        collar_index = 1
        bust_index = waist_index = arm_index = 0
        change_arm_length
      end
      puts "index: #{search_run_indexer} == results: #{@shirts.size}"
      puts "collar_index = #{collar_index}, bust_index = #{bust_index}, waist_index = #{waist_index}, arm_index = #{arm_index}"
      if @shirts.size > 4
        break
      end
    end #while index < 30
      
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shirts }
    end
  end

  def show
    @shirt = Shirt.find_by_code(params[:id])    
   end

  def new
  end

  def edit
    @shirt = Shirt.find_by_code(params[:id])    
    
    respond_to do |format|
      format.html { render action: 'edit' }
      format.json { render json: @shirts }
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
        format.html { redirect_to @shirt, notice: 'Shirt was successfully updated.' }
        format.json { head :no_content }
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

    def range(params, index, arm)
      if params.to_i == 0
        0...1000
      elsif arm
        (params.to_i - index )...(params.to_i + index + 1)
      else
        (params.to_i - 1)...(params.to_i + index + 1)
      end

    end

    def change_arm_length
      if params[:size_arm].to_i > 20
        params[:size_arm] = 15
        @shortsleeve = true
      else
        params[:size_arm] = 70
        @longsleeve = true
      end
    end
end
