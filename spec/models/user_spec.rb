require "spec_helper"
require 'user'

describe User do

	# let(:data) {"LastName\tFirstName\tGender\tDateofBirth\tFavoriteColor\t
	# 	Johnson\tJerome\tM\t'1986-03-05'\tblue"}
	# let(:result) {[['LastName, FirstName, Gender, DateofBirth, FavoriteColor'],
	# 	['Johnson', 'Jerome', 'M', '1986-03-05', 'blue']]}


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

	it "has a birthdate of 08-29-1958" do
		user = User.new
		expect(user.date_of_birth).to eq('08-29-1958')
	end

	# it "should parse file contents and return a result" do
	#   File.stub(:open).with("filename","rb") { StringIO.new(data) }
	#   User.import(data).should eq(result)
	# end

	# it "sorts users by gender, ladies first" do
	# 	female = User.new(:last_name => 'jones', :first_name =>'lisa', :gender =>'F',
	# 		:date_of_birth =>'1984-03-03', :favorite_color =>'pink')
	# 	male = User.new(:last_name => 'williams', :first_name =>'jason', :gender =>'M',
	# 		:date_of_birth =>'1984-05-03', :favorite_color =>'blue')
	# 	User.order(:gender)
	# 	expect(female.gender).to be < (male.gender)
	# end

end

