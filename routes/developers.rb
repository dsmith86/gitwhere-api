class Application < Sinatra::Base

	map :developers do |namespace|
		namespace.map(:developers_by_location).to('/location/developers')
	end

	namespace :developers do

		get :developers_by_location do
			developers = @@github_client.search_users "location:Hattiesburg,MS"

			dev_details = Array.new

			developers.items.each do |developer|
				#binding.pry

				dev_details << {
					login: developer.login
				}
			end

			#binding.pry

			dev_details.to_json
		end

	end

end