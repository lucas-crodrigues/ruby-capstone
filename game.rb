require 'date'

class Game
  attr_accessor :last_played, :multiplayer
  attr_reader :id

  def initialize(last_played, multiplayer)
    super(id = Random.rand(1..1000))
    @id = id
    @last_played = last_played
    @multiplayer = multiplayer
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    @archived = if super || Date.today - Date.parse(@last_played) > 2 * 365
                  true
                else
                  false
                end
  end
end
