class API < Grape::API
  version 'v1', using: :path, vendor: 'reverb'
  format :json


  resource :users do
    desc "Return users sorted by gender"
    get :gender do
      User.order(:gender)
    end

    desc "Create a new user"
    params do
      requires :user_params, type: String
    end
    post do
      User.create!(params[:user_params])
      puts params
    end

    get :hello do
      { text: 'Hello from API'}
    end

    desc "Return users sorted by birtdate"
    get :birthdays do
      User.order(:date_of_birth)
    end

    desc "Return users sorted by name"
    get :names do
      User.order(:last_name, :first_name)
    end
  end
end