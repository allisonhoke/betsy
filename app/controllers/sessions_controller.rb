class SessionsController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']
    redirect to login_failure unless auth_hash['uid']

    @merchant = Merchant.find_by(uid: auth_hash[:uid], provider: 'github')
    if @merchant.nil?
      # User doesn't match anything in the DB.
      # Attempt to create a new user.
      @merchant = Merchant.build_from_github(auth_hash)
      render :new_session_path unless @merchant.save
    end

    session[:merchant_id] = @merchant.id

    redirect_to root_path
  end

  def new

  end

  def update

  end

  def destroy
    session.delete(:merchant_id)
    redirect_to root_path
  end

  def index
    @user = Merchant.find(session[:merchant_id]) # < recalls the value set in a previous request
  end
end
