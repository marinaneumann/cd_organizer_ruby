require './lib/cd'

@cd = []

def main_menu
  loop do

    puts "Welcome to the CD Organizer"
    puts "\n\n_____________________________________\n"
    #list of all cds
    #menu
    puts "Press 'ar' to find an album by artist"
    puts "Press 'aa' to find an abum by name"
    puts "Press 'x' to exit the program"
    puts "Press 'l' to list all the cds"
    selection = gets.chomp
    if selection == 'ar'
      puts " Please enter the artist you'd like to search for"
      artist = gets.chomp
    elsif selection == 'aa'
      puts " Please enter the album name you'd like to search for"
      name = gets.chomp
    elsif selection == 'l'
      puts "Here's a list of all your albums"
      show_list
    elsif selection == 'x'
      puts "Goodbye"
      exit
    else
      puts "Please choose a valid selection"
      main_menu
    end
  end

end

main_menu
