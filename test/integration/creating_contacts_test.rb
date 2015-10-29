require 'test_helper'

class CreatingContactsTest < ActionDispatch::IntegrationTest
	def setup
		@user = User.create(email:"billy@example.com")
	end

	def token_header(token)
		ActionController::HttpAuthentication::Token.encode_credentials(token)
	end

	test "creates a new contact" do
		post '/contacts', {
			contact: {
				name: "Grandma",
				email: "grandma@example.com",
				phone_number: "416-555-5555",
				address: "Toronto, ON, CA"
			} }.to_json,
			{ 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s,
				'Authorization' => token_header(@user.auth_token) }

		assert_equal 201, response.status
		assert_equal Mime::JSON, response.content_type

		contact = JSON.parse(response.body, symbolize_names: true)
		assert_equal contact_url(contact[:id]), response.location
		assert_equal "Grandma", contact[:name]
		assert_equal "grandma@example.com", contact[:email]
		assert_equal "416-555-5555", contact[:phone_number]
		assert_equal "Toronto, ON, CA", contact[:address]
	end
end
