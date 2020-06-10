class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def library
    @own_contents = OwnContent.all
    @third_party_contents =ThirdPartyContent.all
  end

  def newsfeed
    @own_contents = OwnContent.all
    @today_content = @own_contents.select {|own_content|  own_content.published_date >= (Date.today()-7) && own_content.published_date <= Date.today() }
    @week_date = Date.today()-7
  end

end
