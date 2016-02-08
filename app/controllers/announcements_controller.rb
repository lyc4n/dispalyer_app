class AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.all
  end

  def show
    attrs = {key: params[:key]}.merge(defaults)
    @announcement = Announcement.where("key like ?", params[:key]).first || Announcement.new(attrs)
  end

  def new
    @announcement = Announcement.new(defaults)
  end

  def edit
    @announcement = Announcement.where("key like ?", params[:key]).first!
  end

  private
  def defaults
    { content: "Waiting...",
      marquee: "Hello from displayer_app",
      background: "black",
      foreground: "green" }
  end
end
