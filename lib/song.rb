class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end


  def self.new_by_name (song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name (song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name (song_name)
    self.all.detect { |s|
      s.name == song_name }
  end

  def self.find_or_create_by_name (song_name)
    if self.all.detect.include?(song_name)
      self.all.detect { |s|
        s.name == song_name }
    else
      new_song = Song.new
      new_song.name = song_name
      new_song
    end
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename (full_song)
    parts = full_song.split(" - ")
    artist = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = Song.new
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename (full_song)
    parts = full_song.split(" - ")
    artist = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = Song.new
    song.name = song_name
    song.artist_name = artist
    song.save
    song
  end


  def self.destroy_all
    @@all.clear
  end



end







#
#
# class Song
#
#   attr_accessor :Song
#
#   def initalize (song)
#     @song = song
#   end
#
#   def self.create (song)
#     song
#   end
# end
