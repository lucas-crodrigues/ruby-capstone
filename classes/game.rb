require 'date'
require_relative './item'

class Game < Item
  attr_accessor :publish_date, :last_played, :multiplayer
  attr_reader :id

  def initialize(publish_date, last_played, multiplayer)
    super(publish_date)
    @last_played = last_played
    @multiplayer = multiplayer
    @archived = can_be_archived?
  end

  def as_hash
    {
      'multiplayer' => @multiplayer,
      'last_played' => @last_played,
      'publish_date' => @publish_date,
      'archived' => @archived
    }
  end

  private

  def can_be_archived?
    @archived = super || Date.today - Date.parse(@last_played) > 2 * 365
  end
end
