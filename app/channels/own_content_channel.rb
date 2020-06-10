class OwnContentChannel < ApplicationCable::Channel
  def subscribed
    own_content = OwnContent.find(params[:id])
    stream_for own_content
  end
end
