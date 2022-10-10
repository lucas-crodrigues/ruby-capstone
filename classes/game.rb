require 'date'
require_relative './item'

class Game < Item
  attr_accessor :last_played, :multiplayer, :publish_date
  attr_reader :id

  def initialize(last_played, multiplayer, publish_date)
    super(id = Random.rand(1..1000))
    @id = id
    @publish_date = publish_date
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
