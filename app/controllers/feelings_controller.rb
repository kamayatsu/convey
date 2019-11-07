class FeelingsController < ApplicationController
  before_action :set_feeling, only: [:show, :edit, :update, :destroy]

  # GET /feelings
  # GET /feelings.json
  def index
    @feelings = Feeling.order(created_at: "DESC")
    @recommends = Feeling.order(created_at: "ASC")
    @magazines = Feeling.order(created_at: "DESC")
    @pickup = Feeling.order(created_at: "ASC")
    @attention = Feeling.order(created_at: "DESC")
    @popular = Feeling.order(created_at: "ASC")
  end

  # GET /feelings/1
  # GET /feelings/1.json
  def show
    @exist = ActiveStorage::Attachment.find_by(record_id: @feeling.id)
    @image = ActiveStorage::Blob.find(@exist.blob_id) if @exist
    if user_signed_in?
      @userid = current_user.id
    else
      @userid = 0
    end
  end

  # GET /feelings/new
  def new
    @feeling = Feeling.new
  end

  # GET /feelings/1/edit
  def edit; end

  # POST /feelings
  # POST /feelings.json
  def create
    @feeling = Feeling.new(feeling_params)

    respond_to do |format|
      if @feeling.save
        format.html { redirect_to @feeling, notice: 'Feeling was successfully created.' }
        format.json { render :show, status: :created, location: @feeling }
      else
        format.html { render :new }
        format.json { render json: @feeling.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feelings/1
  # PATCH/PUT /feelings/1.json
  def update
    respond_to do |format|
      if @feeling.update(feeling_params)
        format.html { redirect_to @feeling, notice: 'Feeling was successfully updated.' }
        format.json { render :show, status: :ok, location: @feeling }
      else
        format.html { render :edit }
        format.json { render json: @feeling.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feelings/1
  # DELETE /feelings/1.json
  def destroy
    @feeling.destroy
    respond_to do |format|
      format.html { redirect_to feelings_url, notice: 'Feeling was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_feeling
    @feeling = Feeling.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def feeling_params
    params.require(:feeling).permit(:subject, :detail, :organization, :response).merge(user_id: current_user.id)
  end
end
