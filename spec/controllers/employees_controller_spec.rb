require 'rails_helper'

RSpec.describe EmployeesController, :type => :controller do

  describe "GET import" do
    it "returns http success" do
      get :import
      expect(response).to be_success
    end
  end

end
