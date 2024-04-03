class StatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'status'

    ActionCable.server.broadcast('status', { message: Time.now.to_i })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
