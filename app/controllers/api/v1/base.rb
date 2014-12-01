module API
	module V1
		class Base < Grape::API

			### Handling Error Exception
			before do 
				error!('401 Unauthorized', 401) unless headers['Password'] == 'spriteXchange'
			end

			# route :any, '*path' do
  	# 			error! "This should have http status code 400"
			# end
			mount API::V1::Events
		end
	end
end
