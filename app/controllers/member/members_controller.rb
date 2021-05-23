class Member::MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :ensure_correct_member, only: [:edit, :update]

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    if @member.update(member_params)
      redirect_to member_member_path(@member)
    else
      render :edit
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :introduction, :profile_image_id)
  end

  def ensure_correct_member
    @member = Member.find(params[:id])
    unless @member == current_member
      redirect_to member_member_path(current_member)
    end
  end
end
