class Application < Sinatra::Base

	map :developers do |namespace|
		namespace.map(:list).to('/developers/list')
	end

	namespace :developers do

		get :list do
			
		end

	end

end