Gem::Specification.new do |s|
  s.name        = 'jukebox_player'
  s.version     = '0.1.0'
  s.date        = '2012-11-23'
  s.summary     = "Jukebox player!"
  s.description = "NeonPlay's jukebox proxy"
  s.authors     = ["Federico Romero"]
  s.email       = 'federico.romero@neonroots.com'
  s.files       = ["lib/jukebox_player.rb"]

  s.add_dependency("httparty")
  s.add_dependency("json")

end
