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
      @own_contents = OwnContent.all.sort_by { |date| date.published_date}.reverse!
      @education_contents = EducationContent.all.sort_by { |date| date.created_at}.reverse!
    end
  end

  def newsfeed
    @own_contents = OwnContent.all
    #@today_content = @own_contents.select {|own_content|  own_content.published_date >= (Date.today()- 14) && own_content.published_date <= Date.today() }
    #@today_content = @today_content.sort_by {|article| article.published_date}
    #@today_content = @today_content.reverse
    @today_content = @own_contents.last(3)
    @week_date = Date.today()-7
    @top_edu_content = EducationContent.last(3)
    @didyouknows = Didyouknow.all
    @education_contents = EducationContent.all
  end

  def about
  end

  def faq
  end

end
