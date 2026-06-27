class TodosController < ApplicationController
  before_action :set_task_find
  before_action :set_todo_find, only: %i[toggle edit update destroy]

  def toggle
    @todo.toggle!(:status)
    render partial: "todos/todo", locals: { todo: @todo }
  end

  def edit
  end

  def new
    @todo = @task.todos.new
  end

  def update
    if @todo.update(todo_params)
      render partial: "todos/todo", locals: { todo: @todo }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @todo = @task.todos.new(todo_params)

    if @todo.save
      respond_to do |format|
        format.html { redirect_to @task }
        format.turbo_stream
      end
    else
      render "tasks/show", status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to @task, notice: "You have deleted the todo successfully" }
      format.turbo_stream
    end
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
