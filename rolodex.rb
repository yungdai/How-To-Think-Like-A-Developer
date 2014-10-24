# thic class stores the contacdt information for the crm.rb program
class Rolodex
  # to all only the reading of the array
  attr_reader :contacts


  # Global Class Variable for the index
  @@index = 1000

  # initialize a new contact array
  def initialize
    @contacts = []
  end

  # this method adds a new unique identifier, incriment the index, and add the contact to @contacts
  def add_contact(contact)
    contact.id = @@index
    @@index += 1
    @contact << contact
  end
end

