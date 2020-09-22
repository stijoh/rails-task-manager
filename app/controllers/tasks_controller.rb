class TasksController < ApplicationController
  before_action :find_task, only: [:show, :update, :destroy, :edit]
  def index
    @task = Task.all
  end

  def show
    @completed = @task.completed ? 'This task is completed' : 'This task is not completed'
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@task)
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
