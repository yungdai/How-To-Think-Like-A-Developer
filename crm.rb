# Create a method to ask the users for input

# Add required files to the program
require_relative './contact.rb'
require_relative './rolodex.rb'

# Main CRM class
class CRM
  attr_accessor :name
  def initialize(name)
    @name = name
    @rolodex = Rolodex.new
  end

  def print_main_menu
    puts "[1] Add a contact"
    puts "[2] Modify a contact"
    puts "[3] Display all contacts"
    puts "[4] Display one contact"
    puts "[5] Display an attribute of the contact"
    puts "[6] Delete a contact"
    puts "[7] Quit"
    puts "Enter a number:"
  end


  # get user input
  def main_menu
    puts "Welcome to #{@name}"

    #infinit loop that wait's until input == 7
    while true
      print_main_menu
      input = gets.chomp.to_i
      return if input == 7
      choose_option(input)
    end

  end

  # users gets to choose an option
  def choose_option(option)
      case option
        when 1 then add_contact
        when 2 then modify_contact
        when 3 then display_all_contacts
        when 4 then display_one_contact
        when 5 then display_attrib
        when 6 then delete_contact
        else
          puts "Invalid Option, Try again"
          return
      end
  end

  # methods for the options chosen

  def add_contact
    print "First Name: "
    first_name = gets.chomp
    print "Last Name: "
    last_name = gets.chomp
    print "Email: "
    email = gets.chomp
    print "Note: "
    note = gets.chomp

    #
    contact = Contact.new(first_name, last_name, email, note)
    @rolodex.add_contact(contact)
  end

  def display_all_contacts
    @rolo.contacts.each do |contact|
      puts "#{contact.first_name} #{contact.last_name} <#{contact.email}>"
    end
  end
end


crm  = CRM.new("Bitmaker Labs CRM")
crm.main_menu
