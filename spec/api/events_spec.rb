require 'rails_helper'
describe "Events API" do
	fixtures :events
	it "Events List API should throw exceptions when password is not passed" do
		get "/api/v1/events/list.json"      # test for the 200 status-code
		expect_status("401")
		expect_header("Content-Type","application/json")
		expect_json({:success =>false,:message => "401 Unauthorized"})
	end

	it "Events List API should return events list with proper data types" do
		get "/api/v1/events/list",{},{"Password" => "spritle"}
		expect(response).to be_success
		expect_json_types('events.*', {id: :integer,title: :string})
		expect_json_keys('events.0', [:id, :title, :location])
	end

	it "Events List API should return events list with proper format" do
		get "/api/v1/events/list", {},{"Password" => "spritle"}
		expect(response).to be_success
		expect_json("events.0",{:id => 1,:title => "SpriteXchange Nov Event"})
	end
end