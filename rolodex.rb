# Create a new class Object to
class Rolodex
  # to all only the reading of the array
  attr_reader :contacts


  # Global Class Variable for the index
  @@index = 1000

  # initialize a new contact array
  def initialize
    @contacts = []
  end

  # this method adds a new unique identifier, increment the index, and add the contact ID into @contacts array
  def add_contact(contact)
    contact.id = @@index
    @@index += 1
    @contacts << contact
  end

  def display_specific_contact(contact_id)
     @contacts.each do |contact|
       if contact.id == contact_id
         return contact
       end
     end
  end

  def display_all
    @contacts.each do |contact|
      puts "Contact ID: #{contact.id},  #{contact.first_name} #{contact.last_name} <#{contact.email}>, NOTE: #{contact.note}"
    end
  end

  def display_attribute(contact_id)
    @contacts.each do |contact|
      if contact.id == contact_id
        return contact
      end
    end
  end
end