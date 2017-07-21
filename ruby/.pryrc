begin
  require 'spirit_hands'
  SpiritHands.prompt = '<b>[<cmd/>]</b> <red><sep/></red> '
  SpiritHands.awesome_print = false
rescue LoadError => e
  raise unless e.message =~ /.*such file.*spirit_hands/
  puts 'no SpiritHands'
end
