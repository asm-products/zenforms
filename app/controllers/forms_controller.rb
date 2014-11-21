class FormsController < ApplicationController
  def new
    notice = Notice.find_by_token(params[:token])
    if notice
      @employee_id = notice.employee_id
      @form = Form.new

    else
      flash[:error] = "Invalid token!!!"
      redirect_to root_path
    end
  end

  def create
    @form = Form.new(form_params)
    if @form.save
      flash[:success] = "Form submitted successfully"
      employee = @form.employee
      employee.notices.all.each {|notice| notice.delete}
      redirect_to root_path
    else
      @employee_id = params[:form][:employee_id]
      flash[:error] = "Form not filled in properly"
      render :new
    end
  end

  private

  def form_params
    params.require(:form).permit(:name,:ssn,:address_street,:address_city,:address_state, :address_zip, :phone, :employee_id)
  end

end