require 'spec_helper'

describe SessionsController do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  it "should allow signing in on mobile platform" do
    user = create(:user)
    post :create, :user => {:nickname => user.nickname, :password => '123456'}, :format => :mobile
    should respond_with(:redirect)
    should redirect_to(root_path)
  end

  it "should GET #new" do
    get :new

    should respond_with(:success)
  end
end
