class EmployeesController < ApplicationController
  include CurrencyHelper

  def import
  end

  def index
    # TODO scope within a company
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(sanitized_employee_params)

    respond_to do |format|
      if @employee.save
        format.html {
          redirect_to employees_path
        }
        format.json {
          render json: @employee
        }
      else
        format.html {
          render :new
        }
        format.json {
          render json: {errors: @employee.errors.full_messages.join(', ')}, status: 400
        }
      end
      format.js {}
    end
  end

  protected

  def sanitized_employee_params
    prms = params.require(:employee).permit(:email_address, :payment_amount)
    # TODO move this to the Employee model
    prms[:payment_amount] = dollar_string_to_cents(prms[:payment_amount])
    prms
  end
end
