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
    puts "Enter a number or type 'display all' to display all contacts:"
  end


  # get user input
  def main_menu
    puts "Welcome to #{@name}"

    #infinit loop that wait's until input == 7
    while true
      print_main_menu
      input = gets.chomp.to_s
      return if input == "7"
      choose_option(input)
    end

  end

  # users gets to choose an option
  def choose_option(option)
    case option
      when "1" then add_contact
      when "2" then modify_contact
      when "3" then display_all_contacts
      when "4" then display_one_contact
      when "5" then display_attrib
      when "6" then delete_contact
      when "display all" then display_all_contacts
      else
        puts "Invalid Option, Try again"
        return
    end
  end

  # methods for the options chosen
  # Adding a contact to the Rolodex.object
  #
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
    puts "Enter the contact ID you would like to modify"
    modify_contact_id = gets.chomp.to_i
    contact_to_modify = @rolodex.display_specific_contact(modify_contact_id)
    puts "Selected contact #{contact_to_modify.first_name} #{contact_to_modify.last_name}"
    puts "Enter the contact attribute you want to modify (first_name, last_name, email, note):"
    modify_attrib = gets.chomp.to_s
    puts "What would you like the new value to be?"
    new_value = gets.chomp.to_s
    puts "Are you sure you want to continue (y or n)?"
    selection = gets.chomp.to_s
    if selection == "y"
      # @Object.send (writer, written value into the writer)
      # remember that the writer accessory is formatted as value=.
      # remember that the reader accessory is formatted as value.
      contact_to_modify.send("#{modify_attrib}=", new_value)
      # puts "The contact information is now #{@rolodex.contacts.first_name, # uncomment to see the object after it's been modified
      display_all_contacts
    elsif selection == "n"
      puts "Exiting contact modification and returning to the main menu"
      puts ""
      main_menu
    else
      puts "I don't understand your selection, cancelling function and returning to the main menu"
      main_menu
    end


    #puts @rolodex.contacts.inspect # this comamand shows you what is inside the object, uncomment to use this line.

  end


  def display_all_contacts
    # @rolodex.contacts.each do |contact|
    #   puts "Contact ID: #{contact.id},  #{contact.first_name} #{contact.last_name} <#{contact.email}>, NOTE: #{contact.note}"
    # end
    @rolodex.display_all
  end


  # This method is for getting a user ID and displaying it's contacts.
  def display_one_contact
    puts "Enter the contact ID you would like to display"
    contact_id = gets.chomp.to_i
    contact_to_display = @rolodex.display_specific_contact(contact_id)
    puts "First Name: #{contact_to_display.first_name}"
    puts "Last Name: #{contact_to_display.last_name}"
    puts "Email: #{contact_to_display.email}"
    puts "Notes: #{contact_to_display.note}"
  end

  def display_attrib
    puts "Enter in the contact ID you would like to see an attribute for:"
    contact_id = gets.chomp.to_i
    contact_attribute_to_view = @rolodex.display_specific_contact(contact_id)
    puts "Which attribute would you like to see from this contact (first_name, last_name, email, note)?"
    attrib_to_view = gets.chomp.to_s
    puts "The attribute #{attrib_to_view} for #{contact_attribute_to_view.first_name} #{contact_attribute_to_view.last_name}, is " # + contact_attribute_to_view."#{attrib_to_view}"
  end

  # display a menu to select which attribute to sort the contacts by
  def display_by_attr_menu
    puts "\e[H\e[2J"
    puts "Sort contacts by:"
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] Email"
    puts "[4] Note"
    puts "[5] User ID"
  end

end


crm  = CRM.new("Bitmaker Labs CRM")
crm.main_menu