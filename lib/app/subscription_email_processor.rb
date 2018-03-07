#!/usr/bin/env ruby

require './subscription_email_sender.rb'

class SubscriptionEmailProcessor
  # Processor that decides whether to send email or not depending on selection selected
  # on registration

  marketing_email_sender = nil

  def initialize()
    subscription_email_sender = SubscriptionEmailSender.new
  end

  def process(registration_data)
    if registration_data.recieve_marketing_emails
      puts '[x] sending marketing subscription email'
      marketing_email_sender.sendMessage(make_marketing_subscription_email_content_text(registration_data))
    else
      puts '[x] not sending marketing subscription email'
  end

  def make_marketing_subscription_email_content_text(registration_data)
    first_name = registration_data.first_name
    'Dear ' + first_name + ',\n Thank you for subscribing to marketing emails.\n Best regards.'
  end

end
