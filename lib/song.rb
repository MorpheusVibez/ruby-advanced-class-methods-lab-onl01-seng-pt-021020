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
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song
  end

  def self.create_by_name(song_title)
    song = self.create
    song.name = song_title
    self.all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !find_by_name(name)
      create_by_name(name)
    else
      find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name[0]}.uniq
  end

  def self.new_from_filename(filename)
    data = filename.sub!(/.mp3/, '').split(' - ')
    song = self.new
    song.artist_name = data[0]
    song.name = data[1]
    song
  end

  def self.create_from_filename(filename)
    data = filename.sub!(/.mp3/, '').split(' - ')
    song = self.create
    song.artist_name = data[0]
    song.name = data[1]
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
