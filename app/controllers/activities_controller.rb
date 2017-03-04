class ActivitiesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :set_assigned_tasks, only: [:new, :create, :edit, :update]

  def index
    authorize Activity
    @activities = policy_scope(Activity)
  end

  def show
  end

  def new
    @activity = Activity.new
    authorize @activity
  end

  def edit
  end

  def create
    @activity = current_user.activities.build(activity_params)
    authorize @activity

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
    authorize @activity
  end

  def set_assigned_tasks
    @assigned_tasks = current_user.tasks
  end

  def activity_params
    params.require(:activity).permit(:duration, :date, :description, :task_id)
  end
end
