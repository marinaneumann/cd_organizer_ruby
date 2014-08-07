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
    puts "Press 'l' to list all the cds"
    puts "Press 'a' to add a cd"
    puts "Press 'ar' to find an cd by artist"
    puts "Press 'aa' to find an cd by name"
    puts "Enter 'artists' to show all of your artists"
    puts "Press 'x' to exit the program"

    selection = gets.chomp
    if selection == 'a'
      add_cd
    elsif selection == 'ar'
      puts " Please enter the artist you'd like to search for"
      @input_artist = gets.chomp
        find_by_artist
    elsif selection == 'aa'
      puts " Please enter the cd name you'd like to search for"
      @input_name = gets.chomp
        find_by_name
    elsif selection == 'artists'
      if Cd.all == []
        puts "You have no CDs yet, please add one."
      else
        puts "Here are all of your artists."
        show_artists
        puts "Enter an artist name to find all the albums for that artist."
        @input_artist = gets.chomp

        show_artist_albums
      end
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

def find_by_artist
  @found_cds_by_artist = Cd.all.select {|cd| cd.artist == @input_artist}
  @found_cds_by_artist.each do |cd|
    puts "CD name: #{cd.name}, Artist: #{cd.artist}\n\n"
  end
end

def find_by_name
  @found_cds_by_name = Cd.all.select {|cd| cd.name == @input_name}
  @found_cds_by_name.each do |cd|
    puts "CD name: #{cd.name}, Artist: #{cd.artist}\n\n"
  end
end

def show_list
  tp Cd.all, :name, :artist
end

def show_artists


   tp Cd.all, :artist
end

def show_artist_albums
  @found_cds_by_artist = Cd.all.select {|cd| cd.artist == @input_artist}
  @found_cds_by_artist.each do |cd|
    puts "CD name: #{cd.name}\n\n"
  end
end


main_menu
