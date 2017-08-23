class TodosController < ApplicationController
  
  def index
    
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
    @todo = Todo.find(params[:id])
  end
  
  def edit
    @todo = Todo.find(params[:id])
  end
  
  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to todo_path(@todo)
      flash[:notice] = "Todo was edited successfuly"
      
    else
      render 'edit'
    end
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:name, :description) #Confirms to the browser to get parameters name and description from todo method
  end
  
end
