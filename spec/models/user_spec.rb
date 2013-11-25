require "spec_helper"
require 'user'

describe User do
	it "has a first name Michael" do
		user = User.new
		user.first_name.should == "michael"
	end

	it "has a last name Jackson" do
		user = User.new
		user.last_name.should == 'jackson'
	end

	it "is a male" do
		user = User.new
		user.gender.should eql("M")
	end

	it "has favorite color of red" do
		user = User.new
		user.favorite_color.should == 'red'
	end

end