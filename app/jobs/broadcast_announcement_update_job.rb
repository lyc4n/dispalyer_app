class BroadcastAnnouncementUpdateJob < ApplicationJob
  queue_as :default

  def perform(announcement)
    view = ApplicationController.renderer.render(announcement)
    ActionCable.server.broadcast "#{announcement.key}_announcement", view
  end
end
