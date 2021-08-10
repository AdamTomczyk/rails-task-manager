class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
     @task = Task.find(params[:id])
  end

   def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to task_path(@task)
  end

   def edit
    @task = Task.find(params[:id])
  end

  def update
    # Find the restaurant we're editing
      @task = Task.find(params[:id])

    # Take the form input and update that restaurant
    @task.update(task_params)

    redirect_to task_path(@task.id)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

private

  # STRONG PARAMS
  def task_params
    params.require(:task).permit(:title, :details)
  end

end
