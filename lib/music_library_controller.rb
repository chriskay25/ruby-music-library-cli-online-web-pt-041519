class MusicLibraryController
  
  attr_accessor :music_importer
  
  def initialize(path = "./db/mp3s") 
    @music = MusicImporter.new(path).import
      # returns array of ["artist - song - genre.mp3", "artist - song...."]
    @music.each {|file| file.chomp!(".mp3")}
      #removes the .mp3 from the genres to make the array easier to work with
  end 
  
  def call 
    user_input = nil
    until user_input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets
    end 
  end 
  
  def list_songs 
    count = 1 
    # @music.each do |song| 
    #   puts "#{count}. #{song}"
    #   count += 1 
    # end 
    songs = Song.all.collect {|song| song}
    songs.sort! {|a, b| a.name <=> b.name}
    songs.each do |song|
      puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      count += 1 
    end 
    
  end 

  
end 


































