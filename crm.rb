# Create a method to ask the users for input

# Main CRM class
class CRM
  def initialize
    
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
    print_main_menu
    input = gets.chomp.to_i
    choose_option(input)
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
        when 7
          puts "Goodbye!"
          return
      end
  end
end


crm  = CRM.new
crm.main_menu
