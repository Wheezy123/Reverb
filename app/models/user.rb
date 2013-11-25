class User < ActiveRecord::Base

  def self.import(file)
    csv = File.open(file.path, 'rb')
    contents = file.read
    if contents.include?("|")
      CSV.open(file.path, 'r', { :col_sep => '|', :headers => true}).each do |row|
        User.create(:last_name => row[0], :first_name => row[1], :gender => row[2],
          :date_of_birth => row[3], :favorite_color => row[4])
      end
    elsif contents.include?("\t")
      CSV.open(file.path, 'r', { :col_sep => "\t", :headers => true}).each do |row|
        User.create(:last_name => row[0], :first_name => row[1], :gender => row[2],
          :date_of_birth => row[3], :favorite_color => row[4])
      end
    else
      CSV.open(file.path, 'r',{:headers => true}).each do |row|
        User.create(:last_name => row[0], :first_name => row[1], :gender => row[2],
          :date_of_birth => row[3], :favorite_color => row[4])
      end
    end
  end
end
