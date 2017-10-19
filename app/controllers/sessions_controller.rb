class SessionsController < ApplicationController

  def new
  end

  def create
    @employee = User.find_by_employee_num(params[:employee_num])
    if @employee.authenticate(params[:password])
      session[:user_id] = @employee.id
    else
      @errors = "Invalid username or password"
      render :new
    end
  end

end
