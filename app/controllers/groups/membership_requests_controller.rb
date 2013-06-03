class Groups::MembershipRequestsController < ApplicationController

  before_filter :load_group_or_redirect_to_root

  def new
    @membership_request = MembershipRequest.new group: @group
    render 'groups/membership_requests/new'
  end

  def create
    @membership_request = MembershipRequest.new params[:membership_request]
    # if @group.members.find_by_user_id(current_user)
    if @group.members.where('email = ?', @membership_request.email).present?
      flash[:alert]   = "A user with that email address is already a member of this group."
    else
      if @group.membership_requests.where('email = ?', @membership_request.email).present?
        flash[:alert] = "A membership request for that email already exists."
      else
        @membership_request.group = @group
        @membership_request.user = current_user if user_signed_in?
        @membership_request.save
        flash[:success] = "Membership requested"
      end
    end
    redirect_to @group
  end

  def index
  end

  def approve
    flash[:success] = "Request approved"
    redirect_to group_membership_requests_path(@group)
  end

  def ignore
  end


  private

  def load_group_or_redirect_to_root
    @group = Group.find_by_id(params[:group_id])
    unless @group.present?
      flash[:alert] = "Invalid group"
      redirect_to root_path
    end
  end
end
