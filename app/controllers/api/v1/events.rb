module API
	module V1
		class Events < Grape::API
			
			#### PATH Versioning
			version 'v1'

			format :json

			before do 
				error!('401 Unauthorized', 401) unless headers['Password'] == 'spritle'
			end

			### Using namspace or resource to define routes
			namespace :events do
				desc "Return list of events"
				get :list do 
					events = Event.all
					present :success, true
					present :events, events
				end

				get ':id', requirements: { id: /[0-9]*/ } do
					event = Event.find(params[:id])
					present :success, true
					present :event, event
				end

				post 'create' do 
					post = Event.create!(params[:event])
					present :success, true
					present :message, "successfully deleted"
				end

				delete ':id' do 
					p "delete----------"
					event = Event.find(params[:id])
					event.delete
					present :success, true
					present :message, "successfully deleted"
				end

			end
		end
	end
end
