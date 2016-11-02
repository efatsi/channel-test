class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room-#{params[:room]}"
  end

  def send_message(data)
    if data["message"].present?
      m = Message.create(user: current_user, body: data["message"], room_id: params[:room])
      ActionCable.server.broadcast "room-#{params[:room]}", message: render_message(m)
    end
  end

  private

  def render_message(message)
    MessagesController.render partial: "messages/message", locals: {message: message}
  end
end
