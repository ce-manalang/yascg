class Question < ApplicationRecord
    after_create_commit :broadcast_question
    after_update_commit :broadcast_question
  
    private
  
    def broadcast_question
      ActionCable.server.broadcast(
        "questions_#{game_session_id}",
        { content: content, id: id, category: category }
      )
    end
end  