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
    @contacts << contact
  end

  # def display_specific_contact(attribute)
  #   @contacts.each do |contact|
  #     if contact.id == attribute
  #       return contact
  #       puts "The specific contact selected is: #{first_name} #{last_name} < #{email}>"
  #     end
  #   end
  # end
  def display_all
    @contacts.each do |contact|
      puts "Contact ID: #{contact.id},  #{contact.first_name} #{contact.last_name} <#{contact.email}>, NOTE: #{contact.note}"
    end
  end
end

