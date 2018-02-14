ready = ->
  App.global_event = App.cable.subscriptions.create {
    channel: "MessagesChannel"
    current_user: $('.current-user-bar').data('id')
    chat_id: window.location.search.substr(1)
  },
  connected: ->
    # Called when the subscription is ready for use on the server
  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->
    if window.location.search.substr(1) == "current_chat=#{data.chat_id}"
      if data.img_attachment != null
        $('.chat-container').append(" \
        <li class='list-group-item'> \
          <div class='user-in-list'> \
            <div class='user-avatar-in-list-small'> \
              <img src='#{data.sender_avatar_url}' alt='avatar'> \
            </div> \
          </div> \
          #{data.message} \
          <img src='#{data.attachment}' alt='avatar'> \
          <p class='timestamp'>#{data.created}<p> \
        </li>")
      else if data.attachment != null
        $('.chat-container').append(" \
        <li class='list-group-item'> \
          <div class='user-in-list'> \
            <div class='user-avatar-in-list-small'> \
              <img src='#{data.sender_avatar_url}' alt='avatar'> \
            </div> \
          </div> \
          #{data.message} \
          <div class='alert aler-info' role='alert' style='width: 80%; float: left;'> \
            #{data.attachment_title}
            <a class='btn btn-outline-primary btn-sm' href=#{data.attachment}> \
              <i class='fa fa-download'></i> \
            </a> \
          </div> \
          <p class='timestamp'>#{data.created}<p> \
        </li>")
      else
        $('.chat-container').append(" \
        <li class='list-group-item'> \
          <div class='user-in-list'> \
            <div class='user-avatar-in-list-small'> \
              <img src='#{data.sender_avatar_url}' alt='avatar'> \
            </div> \
          </div> \
          #{data.message} \
          <p class='timestamp'>#{data.created}<p> \
        </li>")
      window.scrollTo(0,document.body.scrollHeight);


if typeof Turbolinks == "undefined"
  $(document).ready(ready)
else
  $(document).on 'turbolinks:load', ready
