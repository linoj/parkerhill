require File.dirname(__FILE__) + '/../spec_helper'
 
describe UserSessionsController do
  render_views
  
  before :each do
    @user = User.create( :email => 'foo@example.com', :password => 'secret', :password_confirmation => 'secret')
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when authentication is invalid" do
    post :create, :user_session => { :email => "foo@example.com", :password => "badpassword" }
    #response.should render_template(:new)
    response.should redirect_to('/signin')
    UserSession.find.should be_nil
  end
  
  it "create action should redirect to /dashboard when authentication is valid" do
    post :create, :user_session => { :email => "foo@example.com", :password => "secret" }
    response.should redirect_to("/dashboard")
    UserSession.find.user.should == @user
  end
end
