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

	get '/players/:id' do
		@id = params[:id].to_i
		@player = $players[@id]
	  erb :"players/show"
	end

	post '/players' do
		@data = params
		$players.push(@data)		
		redirect '/players'
	end

	get '/players/:id/edit' do
		@id = params[:id].to_i
		@player = $players[@id]
	  erb :"players/edit"
	end

	put '/players/:id' do
		id = params[:id].to_i
		$players[id][:Player] = params[:Player]
		$players[id][:Position] = params[:Position]
		$players[id][:Team] = params[:Team]
		$players[id][:Status] = params[:Status]

		redirect "/players/#{id}"  
	end

	delete '/players/:id' do
		id = params[:id].to_i
		$players.delete_at(id)
		redirect '/players'
	end

end