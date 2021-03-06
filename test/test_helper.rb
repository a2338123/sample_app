ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase 
  fixtures :all
  include ApplicationHelper
  # 如果用户已登录，返回true
  def is_logged_in?
    !session[:user_id].nil?
  end

  
  
end

class ActionDispatch::IntergrationTest
  
  # 登入指定的用户
  def log_in_as(user, password: 'password', remember_me: '1')
    post login_path, params: { session: { email: user.email,
	                                      password: 'password',
										  remember_me: remember_me } }
  end
end
