require './lib/cd'
require 'table_print'


@cd = []

def main_menu
  loop do
    puts "\n\n"
    puts "Welcome to the CD Organizer"
    puts "\n_____________________________________\n\n"
    #list of all cds
    #menu
    puts "Press 'a' to add a cd"
    puts "Press 'ar' to find an cd by artist"
    puts "Press 'aa' to find an cd by name"
    puts "Press 'x' to exit the program"
    puts "Press 'l' to list all the cds"
    selection = gets.chomp
    if selection == 'a'
      add_cd

    elsif selection == 'ar'
      puts " Please enter the artist you'd like to search for"
      artist = gets.chomp

    elsif selection == 'aa'
      puts " Please enter the cd name you'd like to search for"
      name = gets.chomp
    elsif selection == 'l'
      puts "Here's a list of all your cds"
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

def add_cd
  puts "Please enter the cd name"
  cd_name = gets.chomp

  puts "Please enter the artist name"
  cd_artist = gets.chomp

  @cd << Cd.new({:name => cd_name, :artist => cd_artist}).save
  puts "Your CD was added."
  puts "CD name: #{cd_name}, Artist: #{cd_artist}\n\n"
end

def show_list
  tp Cd.all
end

main_menu
