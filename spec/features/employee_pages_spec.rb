require 'rails_helper'
include PageContentSteps
describe 'Employee Pages' do

  describe '#new' do
    before do
      visit new_employee_path
    end

    describe 'content' do
      it_behaves_like 'a page with a form' do
        let(:form_resource) {:employee}
        let(:form_fields) {{payment_amount: :text, email_address: :email}}
        let(:form_submit) {I18n.t('helpers.submit.create', model: 'Employee')}
        let(:form_action) {employees_path}
        let(:form_method) {:post}
      end
    end

    describe 'with good data' do
      let(:email) {'test@example.com'}
      let(:payment_amount) {'$345.02'}
      before do
        fill_in('employee_payment_amount', with: payment_amount)
        fill_in('employee_email_address', with: email)
        submit_form
      end
      it 'creates an employee with the right data' do
        result = Employee.last
        expect(result).not_to be_nil
        expect(result.email_address).to eq email
        expect(result.payment_amount).to eq 34502
      end
    end
  end
end