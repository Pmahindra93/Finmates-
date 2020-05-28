class OwnContentsController < ApplicationController
 before_action :find_content, only: [:show]
  def index
    @own_content = OwnContent.all
    @today_content = @own_content.select {|own_content| own_content.published_date == Date.today()}
  end

  def show
  end

  private

  def find_content
    @own_content = OwnContent.find(params[:id])
  end
end
