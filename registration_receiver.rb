#!/usr/bin/env ruby

require 'bunny'
require './marketing_email_sender.rb'

connection = Bunny.new
connection.start

channel = connection.create_channel
queue = channel.queue('registration-marketing-queue')

begin
  puts ' [*] Waiting for messages. To exit press CTRL+C'

  queue.subscribe(block:true) do |_delivery_info, _properties, body|
    puts " [x] Recieved #{body}"
    sendMessage(body)
  end

rescue Interrupt => _
  connection.close
  exit(0)

end
