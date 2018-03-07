class RegistrationData

  attr_accessor :ssn, :first_name, :last_name, :dob
  attr_accessor :address, :postcode, :city, :country

  def initialize(ssn, first_name, last_name, dob, address, postcode, city, country)
    @ssn = ssn
    @first_name = first_name
    @last_name = last_name
    @dob = dob
    @address = address
    @postcode = postcode
    @city = city
    @country = country
  end

end
