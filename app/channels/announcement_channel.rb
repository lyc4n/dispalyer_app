# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class AnnouncementChannel < ApplicationCable::Channel
  def subscribed
    stream_from "#{current_announcement_key}_announcement"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def announce(data)
    attrs = data['announcement_attrs']
    Announcement.where(key: attrs['key']).first!.tap do |announcement|
      announcement.update_attributes(attrs.except('key'))
    end
  end
end
