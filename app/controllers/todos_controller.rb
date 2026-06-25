class TodosController < ApplicationController
  def edit
  end

  def new
  end

  def update
  end

  def create
    @task = current_user.task.find(params[:task_id])
    @todo = @task.todos.new(todo_params)
  end

  def destroy
  end

  private

  def todo_params
    params.(:todo).permit(:content, :status)
  end
end
