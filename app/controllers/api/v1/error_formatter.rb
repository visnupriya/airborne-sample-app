module API
	module V1
		module ErrorFormatter
			def self.call message, backtrace, options, env
				{ :success => false, :message => message }.to_json
			end
		end
	end
end