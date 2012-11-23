require 'httparty'
require 'json'

class JukeboxPlayer
  attr_accessor :uri

  def self.connect(uri)
    self.new(uri)
  end

  def initialize(uri)
    self.uri = uri
  end

  def play(song, callback_url)
    HTTParty.post("#{uri}/play?callback_url=#{callback_url}", body: song.to_json)
  end

  def volume=(volume)
    HTTParty.post("#{uri}/volume?volume=#{volume}")
  end

  def state
    body = HTTParty.get("#{uri}/status").response.body
    JSON.parse(body)['state']
  end

  def playing?
    state == 'playing'
  end

  def idle?
    state == 'idle'
  end
end
