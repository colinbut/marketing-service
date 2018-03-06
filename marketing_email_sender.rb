#!/usr/bin/env ruby

require 'bunny'

def sendMessage(message)
  connection = Bunny.new
  connection.start

  channel = connection.create_channel

  queue = channel.queue('email-queue')

  channel.default_exchange.publish('test message', routing_key: queue.name)
  puts ' [x] Sent message to RabbitMQ'

  connection.close
end
