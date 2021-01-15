class NominationListsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_nomination_list, only: [:show, :edit, :update, :destroy]

  # GET /nomination_lists
  # GET /nomination_lists.json
  def index
    if params.has_key?(:token)
      render json: @nomination_list = NominationList.find_by(token: params[:token])
      # to_json(include: {albums: {include: :songs}})
    end
  end

  # GET /nomination_lists/1
  # GET /nomination_lists/1.json
  def show
  end

  # GET /nomination_lists/new
  def new
    @nomination_list = NominationList.new
  end

  # GET /nomination_lists/1/edit
  def edit
  end

  # POST /nomination_lists
  # POST /nomination_lists.json
  def create
    @nomination_list = NominationList.find_or_create_by(nomination_list_params)
    
    respond_to do |format|
      if @nomination_list.save
        format.html { redirect_to @nomination_list, notice: 'Nomination list was successfully created.' }
        format.json { render json: @nomination_list }
      else
        format.html { render :new }
        format.json { render json: @nomination_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nomination_lists/1
  # PATCH/PUT /nomination_lists/1.json
  def update
    # @nomination_list.update(nomination_list_params) if params[:nomination_list]
    # movies_params.each do |movie_params|
    #   @nomination_list.movies << Movie.new(movie_params)
    # end

    # respond_to do |format|
    #   if @nomination_list.save
    #     format.html { redirect_to @nomination_list, notice: 'Nomination list was successfully updated.' }
    #     format.json { render json: @nomination_list }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @nomination_list.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /nomination_lists/1
  # DELETE /nomination_lists/1.json
  def destroy
    @nomination_list.destroy
    respond_to do |format|
      format.html { redirect_to nomination_lists_url, notice: 'Nomination list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nomination_list
      @nomination_list = NominationList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nomination_list_params
      params.require(:nomination_list).permit(:token)
    end
end
