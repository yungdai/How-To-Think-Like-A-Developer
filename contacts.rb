class Contact
  attr_accessor :id, :first_name, :last_name, :email, :note

  # remember that the writer accessory is formatted as value=.
  # remember that the reader accessory is formatted as value.
  # reader accessory
  # def first_name
  #   @first_name = first_name
  # end
  #
  # writer accessory
  # def first_name=(first_name)
  #   @first_name = first_name
  # end
  #

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  def display_contact

    puts "Now your contact has:"
    puts "First Name: #{first_name}"
    puts "Last Name: #{last_name}"
    puts "Email: <#{email}>"
    puts "Note: #{note}"
    puts "ID: #{id}"
    puts " "

  end
end

