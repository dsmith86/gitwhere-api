class Application < Sinatra::Base

	map :developers do |namespace|
		namespace.map(:developers_by_location).to('/developers/location/:location')
	end

	namespace :developers do

		get :developers_by_location do |l|

			results = @@github_client.search_users "location:#{l}"

			return if results.items.count == 0

			location = Location.first_or_create({:location => l}, {
				:etag => @@github_client.last_response.headers["x-served-by"]
				})

			#binding.pry

			developers = Array.new

			results.items.each do |developer|

				dev_details = {
					username: developer.login,
					avatar: developer.avatar_url,
					url: developer.html_url
				}

				d = Developer.new
				d.attributes = dev_details

				d.location = location

				d.save

				developers << dev_details
			end

			developers.to_json
		end

	end

end