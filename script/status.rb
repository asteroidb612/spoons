Game.all.each do |g|
  puts "#{g.players.collect {|p| p unless p.tagged }.delete_if{|x| x == nil}.count} left in game id=#{g.id}"
end
puts
puts "#{Player.all.collect {|p| p unless p.tagged}.delete_if{|x| x == nil}.count} players left total of #{Player.all.count}"
