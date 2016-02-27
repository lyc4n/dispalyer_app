App.announcement = App.cable.subscriptions.create {channel: "AnnouncementChannel"},
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('.announcement-container').html(data)

  announce: (data) ->
    @perform 'announce', data

$(document).on 'submit', '.edit_announcement', (e) ->
  e.preventDefault()
  form = $(e.target)
  App.announcement.announce(announcement_attrs: {
    content: form.find('#announcement_content').val(),
    marquee: form.find('#announcement_marquee').val(),
    background: form.find('#announcement_background').val(),
    foreground: form.find('#announcement_foreground').val(),
    key: form.find('#announcement_key').val()
  })
  form.find('input[type=submit]').attr('disabled', false)
  return false
