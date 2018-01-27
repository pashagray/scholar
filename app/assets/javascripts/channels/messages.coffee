ready = ->
  App.global_event = App.cable.subscriptions.create {
    channel: "MessagesChannel"
    current_user: $('.current-user-bar').data('id')
  },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # TODO why do they sometimes multiple? routes issue?
    alert('received!')
    if window.location.search.substr(1) == "current_chat=#{data.chat_id}"
      if data.attachment != null
        $('.chat-container').append(" \
        <li class='list-group-item'> \
          <div class='user-in-list'> \
            <div class='user-avatar-in-list'> \
              <img src='#{data.sender_avatar_url}' alt='avatar'> \
            </div> \
          </div> \
          #{data.message} \
          <img src='#{data.attachment}' alt='avatar'> \
          <p class='timestamp'>#{data.created}<p> \
        </li>")
      else
        $('.chat-container').append(" \
        <li class='list-group-item'> \
          <div class='user-in-list'> \
            <div class='user-avatar-in-list'> \
              <img src='#{data.sender_avatar_url}' alt='avatar'> \
            </div> \
          </div> \
          #{data.message} \
          <p class='timestamp'>#{data.created}<p> \
        </li>")
    objDiv = $('.chat-container')
    if objDiv.length > 0
      objDiv[0].scrollTop = objDiv[0].scrollHeight;

if typeof Turbolinks == "undefined"
  $(document).ready(ready)
else
  $(document).on 'turbolinks:load', ready
