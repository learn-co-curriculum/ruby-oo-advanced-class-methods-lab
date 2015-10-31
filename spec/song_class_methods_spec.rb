require 'spec_helper'

describe "Song Class Methods" do
  describe '.create' do
    it 'instantiates and saves the song' do
      song = Song.create

      expect(Song.all).to include(song)
    end
  end

  describe '.new_by_name' do
    it 'instantiates a song with a name property' do
      song = Song.new_by_name("Blank Spaces")

      expect(song.name).to eq("Blank Spaces")
    end
  end

  describe '.create_by_name' do
    it 'instanties and saves a song with a name property' do
      song = Song.create_by_name("Blank Spaces")

      expect(song.name).to eq("Blank Spaces")
      expect(Song.all).to include(song)
    end
  end

  describe '.find_by_name' do
    it 'can find a song present in @@all by name' do
      song = Song.create_by_name("Blank Spaces")

      expect(Song.find_by_name("Blank Spaces")).to eq(song)
    end
  end

  describe '.find_or_create_by_name' do
    it 'finds or creates a song by name maintaining uniqueness of objects by name property' do
      song_1 = Song.find_or_create_by_name("Blank Spaces")
      song_2 = Song.find_or_create_by_name("Blank Spaces")

      expect(song_1).to eq(song_2)
    end
  end

  describe '.alphabetical' do
    it 'returns all the song instances in alphabetical order by song name' do
      song_1 = Song.create_by_name("Thriller")
      song_2 = Song.create_by_name("Blank Spaces")
      song_3 = Song.create_by_name("Call Me Maybe")

      expect(Song.alphabetical).to eq([song_2, song_3, song_1])
    end
  end

  describe '.new_from_filename' do
    it 'initializes a song and artist_name based on the filename format' do
      song = Song.new_from_filename("Thundercat - For Love I Come.mp3")

      expect(song.name).to eq("For Love I Come")
      expect(song.artist_name).to eq("Thundercat")
    end
  end

  describe '.create_from_filename' do
    it 'initializes and saves a song and artist_name based on the filename format' do
      song = Song.create_from_filename("Thundercat - For Love I Come.mp3")
      song_match = Song.find_by_name("For Love I Come")
      expect(song_match.name).to eq("For Love I Come")
      expect(song_match.artist_name).to eq("Thundercat")
    end
  end
end
