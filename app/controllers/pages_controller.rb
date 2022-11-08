class PagesController < ApplicationController
  def users_options
    @option = 'user'
  end

  def home
    @option = 'home'
  end
end
