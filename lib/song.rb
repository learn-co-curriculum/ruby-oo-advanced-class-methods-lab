require 'pry'

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
    song = Song.new()
    self.all.push(song)
    return song
  end

  def self.new_by_name(song_name)
    song = Song.new()
    song.name = song_name
    self.all.push(song)
    return song
  end

  def self.create_by_name(song_name)
    song = Song.new()
    song.name = song_name
    self.all.push(song)
    return song
  end

  def self.find_by_name(song_name)
    found_song=self.all.find do |songs|
      songs.name == song_name
    end
    found_song
  end

  def self.find_or_create_by_name(song_name)
    check = self.find_by_name(song_name)
    if check
      check
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |object|
      object.name
    end
  end

  def self.new_from_filename(filename)
    artist = filename.split('-')[0].strip
    song = filename.split('-')[1].split('.')[0].strip

    new_song = Song.new
    new_song.name = song
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
  end

  def self.destroy_all 
    #binding.pry
    self.all.clear
  end
end
