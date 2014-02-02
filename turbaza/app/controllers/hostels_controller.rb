class HostelsController < ApplicationController
  before_action :set_hostel, only: [:show, :edit, :update, :destroy]

  # GET /hostels
  # GET /hostels.json
  def index
    @hostels = Hostel.all
    @countries = Country.all
    @regions = Region.all
    @cities = City.all

    @countries.each do |item|
      item.ui_regions = Array.new
      @regions.each do |it|
        if it.country_id == item.id
          item.ui_regions.push(it)
        end
      end
    end

    @regions.each do |it|
      it.ui_cities = Array.new
      @cities.each do |i|
        if i.region_id == it.id
          it.ui_cities.push(i)
        end
      end
    end
  end

  # GET /hostels/1
  # GET /hostels/1.json
  def show
  end

  # GET /hostels/new
  def new
    @hostel = Hostel.new
    @hostel.photo_string = '/avatar.png'

    @countries = Country.all
    @regions = Region.all
    @cities = City.all

    @countries.each do |item|
      item.ui_regions = Array.new
      @regions.each do |it|
        if it.country_id == item.id
          item.ui_regions.push(it)
        end
      end
    end

    @regions.each do |it|
      it.ui_cities = Array.new
      @cities.each do |i|
        if i.region_id == it.id
          it.ui_cities.push(i)
        end
      end
    end

    @is_edit = false

  end

  # GET /hostels/1/edit
  def edit
    @countries = Country.all
    @regions = Region.all
    @cities = City.all

    @countries.each do |item|
      item.ui_regions = Array.new
      @regions.each do |it|
        if it.country_id == item.id
          item.ui_regions.push(it)
        end
      end
    end

    @regions.each do |it|
      it.ui_cities = Array.new
      @cities.each do |i|
        if i.region_id == it.id
          it.ui_cities.push(i)
        end
      end
    end

    @is_edit = true
  end

  # POST /hostels
  # POST /hostels.json
  def create
    @hostel = Hostel.new(hostel_params)
    @hostel.photo_string = '/t1.jpg'

    respond_to do |format|
      if @hostel.save
        format.html { redirect_to hostels_path, notice: 'Hostel was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hostel }
      else
        format.html { redirect_to hostels_path }
        format.json { render json: @hostel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hostels/1
  # PATCH/PUT /hostels/1.json
  def update
    respond_to do |format|
      if @hostel.update(hostel_params)
        format.html { redirect_to hostels_path, notice: 'Hostel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to hostels_path }
        format.json { render json: @hostel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hostels/1
  # DELETE /hostels/1.json
  def destroy
    @hostel.destroy
    respond_to do |format|
      format.html { redirect_to hostels_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hostel
      @hostel = Hostel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hostel_params
      params.require(:hostel).permit(:name, :email, :address, :city_id, :phone, :description, :photo_string)
    end
end
