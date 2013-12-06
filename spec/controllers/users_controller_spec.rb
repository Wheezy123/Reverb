require 'spec_helper'

describe UsersController do
  describe "Post create" do
    POST_PARAMS = { 
      format: :json, 
      user: { 
        last_name: 'jackson', 
        first_name:'michael', 
        gender:'M',
        date_of_birth: Date.today, 
        favorite_color:'blue'
      } 
    }
    it "responds with a 201 status code" do
      post :create, POST_PARAMS
      expect(response.code.to_i).to eq(201)
    end
  end


  it "renders the index template" do
    get :index
    expect(response).to render_template("index")
  end

  it "correctly assigns @users" do
    user = User.create(last_name:"Hendrix", first_name:"Jimmi")
    get :index
    expect(assigns[:users]).to eq([user])
  end
end

















