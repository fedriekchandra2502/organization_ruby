class GroupHasPicsController < ApplicationController
  before_action :set_group_has_pic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /group_has_pics
  # GET /group_has_pics.json
  def index
    @group_has_pics = GroupHasPic.all
  end

  # GET /group_has_pics/1
  # GET /group_has_pics/1.json
  def show
  end

  # GET /group_has_pics/new
  def new
    @group = Group.find(params[:group_id])
    @group_has_pic = GroupHasPic.new
  end

  # GET /group_has_pics/1/edit
  def edit
    @group = Group.find(params[:group_id])
  end

  # POST /group_has_pics
  # POST /group_has_pics.json
  def create
    @group_has_pic = GroupHasPic.new(group_has_pic_params)
    @group_has_pic.save
    redirect_to '/groups/'+params[:group_id]

    # respond_to do |format|
    #   if @group_has_pic.save
    #     format.html { redirect_to @group_group_has_pic, notice: 'Group has pic was successfully created.' }
    #     format.json { render :show, status: :created, location: @group_has_pic }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @group_has_pic.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /group_has_pics/1
  # PATCH/PUT /group_has_pics/1.json
  def update
    @group_has_pic.update(group_has_pic_params)
    redirect_to '/groups/'+params[:group_id]
    # respond_to do |format|
    #   if @group_has_pic.update(group_has_pic_params)
    #     format.html { redirect_to @group_has_pic, notice: 'Group has pic was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @group_has_pic }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @group_has_pic.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /group_has_pics/1
  # DELETE /group_has_pics/1.json
  def destroy
    @group_has_pic.destroy
    redirect_to '/groups/'+params[:group_id]
    # respond_to do |format|
    #   format.html { redirect_to group_has_pics_url, notice: 'Group has pic was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_has_pic
      @group_has_pic = GroupHasPic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_has_pic_params
      params.require(:group_has_pic).permit(:pic_name, :email, :phone, :avatar, :group_id)
    end
end
