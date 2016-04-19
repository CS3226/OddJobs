class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy, :close]
  before_action :is_poster, only: [:edit, :update, :destroy, :close]

  LISTINGS_PER_PAGE = 13

  # GET /listings
  # GET /listings.json
  def index
    if params[:category].nil?
      if params[:search].present?
        @search = Listing.search do
          fulltext params[:search]
          with(:is_open, true)
          paginate :page => params[:page], :per_page => LISTINGS_PER_PAGE
        end
        @listings = @search.results
      else
        @listings = Listing.where(:is_open => true).reverse_order.page(params[:page]).per(LISTINGS_PER_PAGE)
      end
    elsif Category.where( :name => params[:category] ).present?
      @category_id = Category.where( :name => params[:category] ).first.id
      @listings = Listing.where( :category_id => @category_id , :is_open => true).reverse_order.page(params[:page]).per(LISTINGS_PER_PAGE)
    end
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @job_applications = @listing.job_applications
    @job_application = @listing.job_applications.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
    if params[:isApplication] == "true"
      @isApplication = "true"
    else
      @isApplication = "false"
    end
  end

  # GET /listings/new
  def new
    if user_signed_in?
      flash.now[:notice] = "Hello #{current_user.name}, have fun creating a new listing!"
      @listing = Listing.new
      @categories = Category.all.map{|c| [ c.name, c.id ] }
    else
      redirect_to "/users/sign_in"
      flash[:alert] = "Please sign in to create new listings"
    end
  end

  # GET /listings/1/edit
  def edit
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # POST /listings
  # POST /listings.json
  def create
    @categories = Category.all.map{|c| [ c.name, c.id ] }
    if params[:category_id].nil?
      format.html { render :new }
    end
    @listing = Listing.new(listing_params)
    @listing.poster_id = current_user.id
    @listing.category_id = params[:category_id]

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    @categories = Category.all.map{|c| [ c.name, c.id ] }
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # CLOSE /listings/1/close
  def close
    @listing.is_open = false
    @listing.save
    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def is_poster
      redirect_to '/' unless user_signed_in? && current_user.id == @listing.poster_id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title, :description, :remuneration, :category_id, :page)
    end
end
