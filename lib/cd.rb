class Cd
  attr_reader(:name, :artist)

  @@all_cds = []

  def initialize (attributes)
    @name = attributes[:name]
    @artist = attributes[:artist]
  end

  def Cd.all
    @@all_cds
  end

  def Cd.clear
    @@all_cds = []
  end

  def save
   @@all_cds << self
  end

end
