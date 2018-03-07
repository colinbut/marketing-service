#!/usr/bin/env ruby

require 'bunny'
require './subscription_email_processor.rb'
require 'json'
require 'ostruct'

class RegistrationReceiver

  connection = Bunny.new
  connection.start

  channel = connection.create_channel
  queue = channel.queue('registration-marketing-queue')

  subscriptionEmailSender = nil

  def initialize()
    subscriptionEmailSender = SubscriptionEmailSender.new
  end

  begin
    puts ' [*] Waiting for messages. To exit press CTRL+C'

    queue.subscribe(block:true) do |_delivery_info, _properties, body|
      puts " [x] Recieved #{body}"

      # converting from JSON string to 'JSON' object
      json_object = JSON.parse(body, object_class: OpenStruct)

      # building model object from json
      registration_data = RegistrationData.new(json_object.ssn,
                            json_object.firstName,
                            json_object.surname,
                            json_object.surname,
                            json_object.dob,
                            json_object.address.address,
                            json_object.address.postcode,
                            json_object.address.city,
                            json_object.address.country)

      # process
      subscriptionEmailSender.process(registration_data)

    end

  rescue Interrupt => _
    connection.close
    exit(0)

  end

end
