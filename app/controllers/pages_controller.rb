class PagesController < ApplicationController
  skip_before_action :authenticate_user!


  def home
    if user_signed_in?
      redirect_to newsfeed_path
    end
    @top_content = OwnContent.last(3)
  end

  def library
    if params[:query].present?
      @own_contents = OwnContent.search("#{params[:query]}")
      @education_contents = EducationContent.search("#{params[:query]}")
    else
      @own_contents = OwnContent.all
      @education_contents = EducationContent.all
    end
  end

  def newsfeed
    @own_contents = OwnContent.all
    @today_content = @own_contents.select {|own_content|  own_content.published_date >= (Date.today()- 14) && own_content.published_date <= Date.today() }
    @today_content = @today_content.sort_by {|article| article.published_date}
    @today_content = @today_content.reverse
    @week_date = Date.today()-7
    @didyouknows = Didyouknow.all
    @education_contents = EducationContent.all
  end

  def about
  end

  def faq
  end

end
