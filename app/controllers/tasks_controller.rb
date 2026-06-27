class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy]
  before_action :set_task_todos, only: %i[show]

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "You have updated your task successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      redirect_to @task, notice: "You have created you task successfully"
    else
      render @task, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to task_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :priority)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def set_task_todos
    @task = current_user.tasks.includes(:todos).find(params[:id])
  end
end
