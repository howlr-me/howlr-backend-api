# frozen_string_literal: true

module RequestSpecHelper
  def login(user)
    post new_user_session_path,
         params: { email: user.email, password: user.password }.to_json,
         headers: { 'Content-type': 'application/json', 'Accept': 'application/json' }
    get_auth_params_from_login_response_headers(response)
  end

  def logout(user); end

  def get_auth_params_from_login_response_headers(response)
    client = response.headers['client']
    token = response.headers['access-token']
    expiry = response.headers['expiry']
    token_type = response.headers['token-type']
    uid = response.headers['uid']

    auth_params = {
      'access-token': token,
      'client': client,
      'uid': uid,
      'expiry': expiry,
      'token_type': token_type,
      'Accept': 'application/vnd.howlr.v1+json'
    }
    auth_params
  end
end
