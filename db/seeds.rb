User.destroy_all
Contact.destroy_all
user1 = User.create!(email: 'joseph@example.com')
user2 = User.create!(email: 'bob@example.com')
p "Auth token for user 1: #{user1.auth_token}"
p "Auth token for user 2: #{user2.auth_token}"

user1.contacts.create!([
	{
		name: "DHH",
		email: "dhh@example.com",
		phone_number: "416-555-1234",
		address: "Chicago, IL, US"		
	},
	{
		name: "Dave Thomas",
		email: "dave@example.com",
		phone_number: "416-555-1234",
		address: "London, England"
	},
	{
		name: "Matz",
		email: "matz@example.com",
		phone_number: "416-555-1234",
		address: "Tokyo, Japan"
	}
])

user2.contacts.create!([
	{
		name: "Al Capone",
		email: "capone@example.com",
		phone_number: "416-555-1234",
		address: "Chicago, IL, US"		
	},
	{
		name: "Queen Elizabeth",
		email: "elizabeth@example.com",
		phone_number: "416-555-1234",
		address: "London, England"
	},
	{
		name: "Jiro",
		email: "jiro@example.com",
		phone_number: "416-555-1234",
		address: "Tokyo, Japan"
	}
])