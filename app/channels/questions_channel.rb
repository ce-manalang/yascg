class QuestionsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "questions_#{params[:game_session_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end