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

  def play(song)
    HTTParty.post("#{uri}/play", body: song.to_json)
  end

  def volume=(volume)
    HTTParty.post("#{uri}/volume?volume=#{volume}")
  end

  def callback_url=(url)
    HTTParty.post("#{uri}/callback?url=#{url}")
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
