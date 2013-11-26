require "spec_helper"
require 'user'

describe User do
	it "has a first name michael" do
		user = User.new
		expect(user.first_name).to eq("michael")
	end

	it "has a last name jackson" do
		user = User.new
		expect(user.last_name).to eq('jackson')
	end

	it "is a male" do
		user = User.new
		expect(user.gender).to eql("M")
	end

	it "has favorite color of red" do
		user = User.new
		expect(user.favorite_color).to eq('red')
	end

	it "has a birthdate of 9-9-1986" do
		user = User.new
		expect(user.date_of_birth).to eq('9-9-1986')
	end

	it "can import and parse pipe delimited data" do
		contents = pipes.txt.import('/Users/administrator/Documents/Reverb/Reverb/db/pipes.txt')
		expect(contents).to eq(:last_name => 'jackson', :first_name => 'michael',
		 :gender => 'M', :date_of_birth => '1986-09-09', :favorite_color => 'red')
	end

end

