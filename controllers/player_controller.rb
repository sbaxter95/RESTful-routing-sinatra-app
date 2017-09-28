class PlayerController < Sinatra::Base


	configure :development do 
		register Sinatra::Reloader
	end

	set :root, File.join(File.dirname(__FILE__), "..")

	set :views, Proc.new  {File.join(root, 'views')}

	$players = [{
	      Player: "Leonard Fournette",
	      Position: "Running Back",
	      Team: "Jacksonville Jaguars",
	      Status: "Healthy",
	  },
	  {
	      Player: "Tom Brady",
	      Position: "Quarterback",
	      Team: "New England Patriots",
	      Status: "Healthy",
	  },
	  {
	      Player: "Jalen Ramsey",
	      Position: "Corner Back",
	      Team: "Jacksonville Jaguars",
	      Status: "Healthy",
	  }]

	get '/players' do
		@heading = "Players"
		@players = $players
	  	erb :"players/index"
	end

	get '/players/new' do
	  erb :"players/new"
	end

end