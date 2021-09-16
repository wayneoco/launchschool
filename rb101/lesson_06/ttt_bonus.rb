def place_piece!(brd, player)
  player_places_piece!(brd) if player == 'Player'
  computer_places_piece!(brd) if player == 'Computer'
end

def alternate_player(player)
  'Player' if player == 'Computer'
  'Computer' if player == 'Player'
end
