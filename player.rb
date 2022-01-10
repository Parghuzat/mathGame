class Player
  def initialize(id)
    @id = id
    @name = "Player #{id}"
    @lives = 3
  end

  attr_reader :name, :lives, :id
  attr_writer :lives

end