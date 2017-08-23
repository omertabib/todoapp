class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  
  def index
    @todo = Todo.all
  end
  
  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params) #Todo class is the model that goes in to the database and @todo is the varibale that will get the info from the form
    if @todo.save #if the parameters entered right it will save into Todo model and go to the db
      flash[:notice] = "Todo was added successfuly!"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @todo.update(todo_params)
      redirect_to todo_path(@todo)
      flash[:notice] = "Todo was edited successfuly"
    else
      render 'edit'
    end
  end
  
  def destroy
    if @todo.destroy
      redirect_to todos_path()
      flash[:notice] = "Todo was deleted successfuly"
    else
      render 'index'
    end
  end
  
  private
  
  def set_todo
    @todo = Todo.find(params[:id])
  end
  
  def todo_params
    params.require(:todo).permit(:name, :description) #Confirms to the browser to get parameters name and description from todo method
  end
  
end
