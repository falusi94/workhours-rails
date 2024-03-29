class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]
  before_action :set_collections, only: [:new, :edit, :create, :update]
  before_action :authorized?, only: [:edit, :update, :destroy]

  # GET /records
  # GET /records.json
  def index
    @records = RecordDecorator.all
  end

  # GET /records/1
  # GET /records/1.json
  def show
  end

  # GET /records/new
  def new
    @record = Record.new.decorate
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    if current_user.admin?
      @record = Record.new(admin_record_params).decorate
    else
      p = record_params
      p[:user_id] = current_user.id
      @record = Record.new(p).decorate
    end

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      p = record_params
      p = admin_record_params if current_user.admin?
      if @record.update(p)
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = RecordDecorator.find(params[:id])
    end

    def set_collections
      @issues = Issue.all
      if current_user.admin?
        @users = User.all
      else
        @users = [current_user]
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:issue_id, :date, :time)
    end

    def admin_record_params
      params.require(:record).permit(:user_id, :issue_id, :date, :time)
    end

    def authorized?
      redirect_to :back unless @record.editable?(current_user)
    end
end
