# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_announcement_key

    def connect
      self.current_announcement_key = cookies[:announcement_key]
    end
  end
end
