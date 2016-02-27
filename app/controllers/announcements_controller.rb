class AnnouncementsController < ApplicationController
  before_filter :set_key_cookie, except: [:new, :create]

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

  def create
    @announcement = Announcement.create(create_params)
    redirect_to announcement_path(key: @announcement.key)
  end

  private
  def defaults
    { content: "Waiting...",
      marquee: "Hello from displayer_app",
      background: "black",
      foreground: "green" }
  end

  def create_params
    params.require(:announcement).permit(:content, :marquee, :background, :foreground, :key)
  end

  def set_key_cookie
    cookies[:announcement_key] = params[:key]
  end
end
