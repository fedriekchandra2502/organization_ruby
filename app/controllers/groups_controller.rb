class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.where("group_name like ?","%"+params[:search].to_s+"%").all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @group_has_pic = GroupHasPic.new
    @pics = GroupHasPic.where(group_id: params[:id]).all
    @users = User.all
    if GroupHasManager.where(group_id: params[:id], user_id: current_user.id).first
      @isManager = true
    else
      @isManager = false
    end
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.create!(group_params)

    redirect_to '/groups'

    # respond_to do |format|
    #   if @group.save
    #     format.html { redirect_to @group, notice: 'Group was successfully created.' }
    #     format.json { render :show, status: :created, location: @group }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @group.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def assignManager
    @manager = GroupHasManager.new
    @manager.user_id = params[:user_id]
    @manager.group_id = params[:group_id]
    @manager.save

    redirect_to '/groups/'+params[:group_id]
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:group_name, :email, :phone, :website, :logo)
    end

    def manager_params
      params.permit(:group_id, :user_id)
    end
end
