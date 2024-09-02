# frozen_string_literal: true

class MessagesReflex < ApplicationReflex
  def create
    @message = Message.new(message_params)
    if @message.save
      CableReady::Channels.instance["ChatChannel"].insert_adjacent_html(
        selector: "#messages",
        position: "beforeend",
        html: ApplicationController.render(partial: "games/message", locals: { message: @message })
      ).broadcast
    end
  end
    
  private
    
  def message_params
    params.require(:message).permit(:content, :card_id)
  end
end
