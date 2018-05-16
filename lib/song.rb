class Song
  attr_reader :name, :artist, :genre

  @@count = 0
  @@artists = Array.new # not unique
  @@genres = Array.new # not unique

  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @@artists.push(self.artist)
    @genre = genre
    @@genres.push(self.genre)
    @@count += 1
  end

  def self.count
    @@count
  end

  def self.artists
    @@artists.uniq # unique
  end

  def self.genres
    @@genres.uniq # unique
  end

  def self.genre_count
    genre_count = Hash.new
    @@genres.collect do |genre|
      genre_count[genre] ? genre_count[genre] += 1 : genre_count[genre] = 1
    end
    genre_count
  end

  def self.artist_count
    artist_count = Hash.new
    @@artists.collect do |artist|
      artist_count[artist] ? artist_count[artist] += 1 : artist_count[artist] = 1
    end
    artist_count
  end
end
