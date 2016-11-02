jQuery(document).on 'turbolinks:load', ->
  messages = $("#messages")
  if messages.length > 0
    App.chat = App.cable.subscriptions.create {
      channel: "ChatChannel",
      room:    messages.data("id")
    },

      connected: ->
        console.log("connected")

      disconnected: ->
        console.log("disconnected")

      received: (data) ->
        $("#messages").append(data.message)

      send_message: (message) ->
        @perform 'send_message', message: message

    $("#submit").click (e) ->
      input = $('#message')
      App.chat.send_message input.val()
      input.val('')
