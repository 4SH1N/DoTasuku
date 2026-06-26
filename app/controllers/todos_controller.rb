class TodosController < ApplicationController
  before_action :set_task_find
  before_action :set_todo_find, only: %i[edit update destroy]

  def edit
  end

  def new
    @todo = @task.todos.new
  end

  def update
    if @todo.update(todo_params)
      redirect_to @task, notice: "You have updated the todo list successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @todo = @task.todos.new(todo_params)

    if @todo.save
      redirect_to @task, notice: "You have cerated your todo successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy
    redirect_to @task, notice: "You have deleted the todo successfully"
  end

  private

  def todo_params
    params.require(:todo).permit(:content, :status)
  end

  def set_task_find
    @task = current_user.tasks.find(params[:task_id])
  end

  def set_todo_find
    @todo = @task.todos.find(params[:id])
  end
end
