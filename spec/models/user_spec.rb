require "spec_helper"
require 'user'

describe User do

	it "sorts Users by gender, females first" do
		male = User.create(last_name:"kedis", first_name:"anthony", gender:"M")
		female = User.create(last_name:"keys", first_name:"alicia", gender:"F")
		users = User.ladies_first
		expect(users.first.gender).to eq("F")
	end


	it "sorts Users by date of birth" do
    young_guy = User.create(last_name:"kid", first_name:"some", gender:"M", 
      date_of_birth:Date.new(1990,03,05))
		old_guy = User.create(last_name:"cash", first_name:"johnny", gender:"M", 
			date_of_birth:Date.new(1932,02,26))
		users = User.birthdays
		expect(users.first.first_name).to eq("johnny")
	end


	it "sorts Users by last name in ascending order" do
		male1 = User.create(last_name:"kedis", first_name:"anthony", gender:"M")
		male2 = User.create(last_name:"appleseed", first_name:"johnny", gender:"M")
		users = User.ladies_first
		expect(users[1].last_name).to eq("kedis")
	end

	it "sorts Users by last name in descending order" do
		thing1 = User.create(last_name:"one", first_name:"thing")
		thing2 = User.create(last_name:"two", first_name:"thing")
		users = User.last_name
		users.first.last_name.should_not  be("one")
	end


	it "imports CSV files, correctly parses and assigns data" do
		contents = File.read("#{Rails.root}/db/csvtest.txt")

		if contents.include?("|")
      sep = '|'
    elsif contents.include?("\t")
      sep = "\t"
    else
      sep = ","
    end
      
    CSV.open("#{Rails.root}/db/csvtest.txt", 'r', { :col_sep => "#{sep}", :headers => true}).each do |row|
      User.create(:last_name => row[0], :first_name => row[1], :gender => row[2],
        :date_of_birth => row[3], :favorite_color => row[4])
    end
   expect(User.first.last_name).to eq("allerby")
   expect(User.first.first_name).to eq("william")
   expect(User.first.gender).to eq("M")
   expect(User.first.date_of_birth).to eq(Date.new(1973,4,13))
   expect(User.first.favorite_color).to eq("green")
	end


		it "imports .xls(Tab delimited), correctly parses and assigns data" do
		contents = File.read("#{Rails.root}/db/xls_test.txt")

		if contents.include?("|")
      sep = '|'
    elsif contents.include?("\t")
      sep = "\t"
    else
      sep = ","
    end
      
    CSV.open("#{Rails.root}/db/xls_test.txt", 'r', { :col_sep => "#{sep}", :headers => true}).each do |row|
      User.create(:last_name => row[0], :first_name => row[1], :gender => row[2],
        :date_of_birth => row[3], :favorite_color => row[4])
    end
   expect(User.first.last_name).to eq("jackson")
   expect(User.first.first_name).to eq("billy")
   expect(User.first.gender).to eq("M")
   expect(User.first.date_of_birth).to eq(Date.new(1983,9,3))
   expect(User.first.favorite_color).to eq("blue")
	end
  

	it "imports Pipe delimited files, correctly parses and assigns data" do
		contents = File.read("#{Rails.root}/db/pipestest.txt")

		if contents.include?("|")
      sep = '|'
    elsif contents.include?("\t")
      sep = "\t"
    else
      sep = ","
    end
      
    CSV.open("#{Rails.root}/db/pipestest.txt", 'r', { :col_sep => "#{sep}", :headers => true}).each do |row|
      User.create(:last_name => row[0], :first_name => row[1], :gender => row[2],
        :date_of_birth => row[3], :favorite_color => row[4])
    end
   expect(User.first.first_name).to eq("michael")
   expect(User.first.last_name).to eq("jackson")
   expect(User.first.gender).to eq("M")
   expect(User.first.date_of_birth).to eq(Date.new(1985,9,9))
   expect(User.first.favorite_color).to eq("blue")
	end
end

