class TasksController < ApplicationController
  def show
    @task = Task.includes(:todos).find(params[:id])
  end

  def new
  end

  def edit
  end

  def update
  end

  def create
    @task = current_user.task.new(task_params)

    if @task.save
      redirect_to task_path(@task), notice: "You have created you task successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :priority)
  end
end
