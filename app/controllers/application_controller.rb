class ApplicationController < ActionController::Base
  protect_from_forgery
  around_action :switch_locale
  before_action :get_locale_languages

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def get_locale_languages
    @locale_languages = [["English","en"],["Portuguese","pt"]]
    return @locale_languages
  end
end
