class ShirtsController < ApplicationController
  before_action :set_shirt, only: [:show, :edit, :update, :destroy]

  # GET /shirts
  # GET /shirts.json
  def index
    @shirts = Shirt.all
  end
	
  def search

      collar_index = bust_index = waist_index = arm_index = search_run_indexer = 0

      while search_run_indexer < 30 do
				set_sizes_ranges(collar_index, bust_index, waist_index, arm_index)
        #@shirts = Shirt.show(shirt_params)
				@shirts = Shirt.where(:size_collar => @collar_range, :size_bust => @bust_range, :size_waist => @waist_range, :size_arm => @arm_range)
        search_run_indexer += 1
        bust_index += 1
        waist_index += 1
        arm_index += 1
        
        if search_run_indexer == 10
          collar_index = 1
          bust_index = 0
          waist_index = 0
          arm_index = 0
        end
        
        if search_run_indexer == 20
          collar_index = 1
          bust_index = 0
          waist_index = 0
          arm_index = 0
          if params[:size_arm].to_i > 20
            params[:size_arm] = 15
            @shortsleeve = true
          else
            params[:size_arm] = 70
            @longsleeve = true
          end
        end


				#puts "index: " + search_run_indexer.to_s
				#puts "results: " + @shirts.size_collar.to_s

        if @shirts.size > 4
          break
        end

      end #while index < 100
      
      #@sorted_shirts = @shirts.order("size_collar ASC").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shirts }
    end
  end

  # GET /shirts/1
  # GET /shirts/1.json
  def show
  end

  # GET /shirts/new
  def new
    @shirt = Shirt.new
  end

  # GET /shirts/1/edit
  def edit
  end

  # POST /shirts
  # POST /shirts.json
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

  # PATCH/PUT /shirts/1
  # PATCH/PUT /shirts/1.json
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

  # DELETE /shirts/1
  # DELETE /shirts/1.json
  def destroy
    @shirt.destroy
    respond_to do |format|
      format.html { redirect_to shirts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shirt
      @shirt = Shirt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shirt_params
      params.require(:shirt).permit(:code, :label, :description, :ean, :profile, :collar, :breast_pocket, :wristband, :color, :cloth, :price, :link, :affiliate, :picture, :size_collar, :size_bust, :size_waist, :size_body, :size_arm, :size_shoulder, :size_back, :size_wrist, :sleeve) if params[:shirt] 
    end

		def set_sizes_ranges(collar_index, bust_index, waist_index, arm_index)
			if params[:size_collar].to_i == 0
				size_collar_max = 1000000
				size_collar_min = 0
			else
				size_collar_max = params[:size_collar].to_i + collar_index + 1
				size_collar_min = params[:size_collar].to_i - collar_index
			end
			@collar_range = size_collar_min...size_collar_max
			
			if params[:size_bust].to_i == 0
				size_bust_max = 1000000
				size_bust_min = 0
			else
				size_bust_max = params[:size_bust].to_i + bust_index + 1
				size_bust_min = params[:size_bust].to_i
			end
			@bust_range = size_bust_min...size_bust_max

			if params[:size_waist].to_i == 0
				size_waist_max = 100000
				size_waist_min = 0
			else
				size_waist_max = params[:size_waist].to_i + waist_index + 1
				size_waist_min = params[:size_waist].to_i
			end
			@waist_range = size_waist_min...size_waist_max

			if params[:size_arm].to_i == 0
				size_arm_max = 100000
				size_arm_min = 0
			else
				size_arm_max = params[:size_arm].to_i + arm_index + 1
				size_arm_min = params[:size_arm].to_i - arm_index
			end
			@arm_range = size_arm_min...size_arm_max
		end
		
end
