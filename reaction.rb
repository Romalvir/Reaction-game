require "ruby2d"

set background: Image.new('star.jpg')
set title: ("Reaction game")
message = Text.new("Click to begin!")
game_begin = false

square = nil
start_time = nil
duration = nil

on :mouse_down do |event|
  # x and y coordinates of the mouse button event
  puts event.x, event.y
  
	if game_begin 

		if square.contains?(event.x, event.y)
			duration = ((Time.now - start_time) * 1000).round
			message = Text.new("Took #{duration} milliseconds Click to play again! ")
			square.remove
			game_begin = false
		end
			else
				message.remove	  
				square = Square.new(
  						x: rand(get(:width) - 25), y: rand(get(:height) - 25),
  						size: 25,
						color: 'green'
						)

				start_time = Time.now
				game_begin = true
			end
	end

show 