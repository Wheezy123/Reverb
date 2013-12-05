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
    user = User.create(last_name:"Jones", first_name:"Jerry")
    get :index
    expect(assigns[:users]).to eq([user])
  end

  it "sorts users by gender, females before males" do
    female = User.create(last_name:"kardashian", first_name:"kim", gender:"F")
    male = User.create(last_name:"west", first_name:"kanye", gender:"M")
    arr = [male,female].sort{|m,f| m.gender <=> f.gender }
    get :index
    expect(arr[0]).to eq(female)
  end

  it "sorts users by last name" do
    adams = User.new(last_name:"adams", first_name:"john")
    zellner = User.new(last_name:"zellner", first_name:"matt")
    arr = [zellner, adams].sort{|a,z| a.last_name <=> z.last_name}
    expect(arr[0]).to eq(adams)
  end

  it "sorts users by date of birth" do
    oldie = User.create(last_name:"man", first_name:"old", gender:"M", 
      date_of_birth: Date.new(1920,4,15))
    newbie = User.create(last_name:"woman", first_name:"young", gender:"F", 
      date_of_birth: Date.new(2000,4,15))
  end

end

















