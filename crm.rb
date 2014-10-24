# Create a method to ask the users for input

# Add required files to the program
require_relative './contacts.rb'
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
    main_menu
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

  def modify_contact
    display_all_contacts
    puts "Enter the contact ID you want to modify:"
    id_selection = gets.chomp.to_i
    puts "Selected #{@rolodex.contacts.id(id_secelection)}"
    puts "Do you want to continue?"
  end


  def display_all_contacts
    @rolodex.contacts.each do |contact|
      puts "Contact ID: #{contact.id},  #{contact.first_name} #{contact.last_name} <#{contact.email}>"
    end
  end

  def display_one_contact
    puts "What is the attribute you want to display?"
  end

  def display_attrib

  end


end


crm  = CRM.new("Bitmaker Labs CRM")
crm.main_menu
