class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :set_nav_option

  def set_locale
    I18n.locale = 'es'
  end

  def set_nav_option
    @option = ''
  end
end
