class StatusesController < ApplicationController

  before_action :require_user, only: [:new, :create, :share]

  def index
    @statuses = Status.all

    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @status = Status.find(params[:id])
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    @status.creator = current_user

    if @status.save
      flash[:notice] = "Status created!"
      redirect_to user_path(@status.creator.username)
    else
      flash[:error] = "Status not created."
      render :new
    end
  end

  def share
    status = Status.find(params[:id])
    new_status = Status.create(body: status.body, creator: current_user, parent_status: status)

    if new_status.save
      flash[:notice] = "Status shared."
    else
      flash[:error] = "Couldn't share the status."
    end
    redirect_to :back
  end

  private

  def status_params
    params.require(:status).permit(:body)
  end
end
