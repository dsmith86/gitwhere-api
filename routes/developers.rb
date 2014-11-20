class Application < Sinatra::Base

	map :developers do |namespace|
		namespace.map(:developers_by_location).to('/developers/location/:location')
		namespace.map(:developer_details).to('/developers/details/:developer')
	end

	namespace :developers do

		get :developers_by_location do |l|

			l = l.gsub(/ /, '+')

			results = @@github_client.search_users "location:#{l}"

			return if results.items.count == 0

			location = Location.first_or_create({:location => l})

			location.save

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

		get :developer_details do |d|
			developer = @@github_client.user(d)

			dev_details = {
				avatar: developer.avatar_url, 
				url: developer.html_url,
				name: developer.name,
				website: developer.blog,
				email: developer.email,
				repo_count: developer.public_repos,
				gist_count: developer.public_gists,
				followers: developer.followers,
				following: developer.following
			}

			dev = Developer.first_or_create({:username => d})

			dev.attributes = dev_details

			dev.save

			dev.attributes.to_json
		end

	end

end