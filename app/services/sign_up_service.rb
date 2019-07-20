# frozen_string_literal: true

class SignUpService
  def initialize(sign_up_params)
    @sign_up_params = sign_up_params
  end

  def perform
    User.transaction do
      @user = User.new(user_params)
      @user.create_client!(client_params)
      @user.add_role(:admin)
      @user.save!
      @user
    end
  end

  private

  attr_reader :sign_up_params

  def client_params
    {
      name: sign_up_params[:client][:name],
      webpage: sign_up_params[:client][:webpage],
      number_of_employees: sign_up_params[:client][:number_of_employees]
    }
  end

  def user_params
    {
      full_name: sign_up_params[:full_name],
      email: sign_up_params[:email]
    }
  end
end
