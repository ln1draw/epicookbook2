require 'spec_helper'

describe UsersController do 

  describe "GET #new" do 
    it "successfully taps that page" do
      get :new
      expect(response).to be_success
    end

    it "renders the :new template" do
      get :new
      response.should render_template :new
    end
  end

  describe 
end
