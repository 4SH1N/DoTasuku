class TodosController < ApplicationController
  def edit
    @task = current_user.tasks.find(params[:task_id])
    @todo = @task.todos.find(params[:id])
  end

  def new
    @task = current_user.tasks.find(params[:task_id])
    @todo = @task.todos.new
  end

  def update
    @task = current_user.tasks.find(params[:task_id])
    @todo = @task.todos.find(params[:id])

    if @todo.update(todo_params)
      redirect_to @task, notice: "You have updated the todo list successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @task = current_user.tasks.find(params[:task_id])
    @todo = @task.todos.new(todo_params)

    if @todo.save
      redirect_to @task, notice: "You have cerated your todo successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def todo_params
    params.require(:todo).permit(:content, :status)
  end
end
