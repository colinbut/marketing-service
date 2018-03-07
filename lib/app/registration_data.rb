class RegistrationData

  attr_accessor :ssn, :first_name, :last_name, :dob
  attr_accessor :address, :postcode, :city, :country
  attr_accessor :recieve_marketing_emails

  def initialize(ssn, first_name, last_name, dob, address, postcode, city, country, recieve_marketing_emails)
    @ssn = ssn
    @first_name = first_name
    @last_name = last_name
    @dob = dob
    @address = address
    @postcode = postcode
    @city = city
    @country = country
    @recieve_marketing_emails = recieve_marketing_emails
  end

end
