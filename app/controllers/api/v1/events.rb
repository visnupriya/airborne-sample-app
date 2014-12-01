
module API
	module V1
		class Events < Grape::API
			
			#### PATH Versioning
			version 'v1'

			format :json

			desc "Simple Hello World"
			resource :hello do
				get do
					## Error Handling
					# error!('Unauthorized', 401) unless headers['Password'] == 'spriteXchange'
					{ hello: "Spritle" }
				end
			end

			### Using namspace or resource to define routes
			namespace :events do
				desc "Return list of events"
				get :list do 
					Event.all
				end

				get ':id', requirements: { id: /[0-9]*/ } do
					Event.find(params[:id])
				end

				post 'create' do 
					before do 
					end
					post = Event.create(params[:event])
				end

				delete '/' do 

				end

			end
		end
	end
end
