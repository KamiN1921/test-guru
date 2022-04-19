class ApplicationController < ActionController::Base
  before_action :set_locale, :authenticate_user!

  def index; end

  def default_url_options
    if I18n.locale != I18n.default_locale
      {lang: I18n.locale }
    else
      {}
    end
  end

  private
  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
