class TasksController < ApplicationController

  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :assign, :assign_activity]

  def index
    @tasks = current_user.manager? ? Task.all : current_user.tasks
  end

  def show
  end

  def new
    @task = Task.new
    authorize @task
  end

  def edit
  end

  def create
    @task = current_user.created_tasks.build(task_params)
    authorize @task

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def assign
  end

  def assign_activity
    @user = User.find_by(id: params[:user_id])
    if !@user.blank? && @user.employee? && @task.users << @user
      redirect_to tasks_url, notice: "Task assigned successfully" 
    else
      redirect_to tasks_url, notice: "Something went wrong" 
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
    authorize @task
  end

  def task_params
    params.require(:task).permit(:start_date, :end_date, :planned_hours, :status, :name)
  end
end
