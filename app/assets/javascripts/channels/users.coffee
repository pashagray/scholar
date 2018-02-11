ready = ->
  App.global_event = App.cable.subscriptions.create {
    channel: "UsersChannel"
    current_user: $('.current-user-bar').data('id')
    current_chat_id: window.location.search.substr(1)
  },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if window.location.search.substr(1) != "current_chat=#{data.chat_id}"
      $(".user_trigger[data-chat_id='#{data.chat_id}']").prependTo($(".chats"));
      $(".last_message[data-chat_id='#{data.chat_id}']").text("#{data.message_content}")
      if data.total_unread != undefined
        if $('.chat_unread').length > 0
          unread_count = $(".user_trigger[data-chat_id='#{data.chat_id}'] .user-in-list .chat_unread").text();
          unread_count = parseInt(unread_count) + 1;
          $(".user_trigger[data-chat_id='#{data.chat_id}'] .user-in-list .chat_unread").text(unread_count);
        else
          $(".user_trigger[data-chat_id='#{data.chat_id}'] .user-in-list").append("<span class='badge badge-primary chat_unread' style='float: right'>1</span>")

        if $(".total_unread").length > 0
          $(".total_unread").text(data.total_unread);
        else
          $(".total_unread_empty").append("<span class='badge badge-primary total_unread' style='float: right'> \
                                          #{data.total_unread} \
                                          </span>")
      else
        alert('data.total_unread == undefined')
        $('.chats').prepend(" \
          <a href='/my/chats?current_chat=#{data.chat_id}'> \
            <button class='list-group-item list-group-item-action user_trigger', data-chat_id='#{data.chat_id}', type='button'> \
              <div class='user-in-list'> \
                #{data.chat_title} \
                <div class='user-avatar-in-list'> \
                  <img src='#{data.user_avatar}' alt='user_avatar'> \
                </div> \
              </div> \
            </button> \
          </a> \
        ")
        $(".user_select[data-user='#{data.author_id}']").remove()

if typeof Turbolinks == "undefined"
  $(document).ready(ready)
else
  $(document).on 'turbolinks:load', ready
