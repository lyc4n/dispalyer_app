class Announcement < ApplicationRecord
  after_update_commit { BroadcastAnnouncementUpdateJob.perform_now(self) }
end
