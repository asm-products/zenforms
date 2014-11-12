class EmployeesController < ApplicationController
  def import
  end

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(sanitized_employee_params)
    success = @employee.save

    respond_to do |format|
      format.html do
        if success
          redirect_to employees_path
        else
          render :new
        end
      end
      format.js
    end
  end

  protected

  def sanitized_employee_params
    prms = params.require(:employee).permit(:email_address, :payment_amount)
    prms[:payment_amount] = CurrencyAdapter.dollar_string_to_cents(prms[:payment_amount])
    prms
  end
end
