class User < ActiveRecord::Base

  def self.import(file)
    CSV.open(file.path, 'r',{:headers => true}).each do |row|
      User.create(:last_name => row[0], :first_name => row[1], :gender => row[2],
        :favorite_color => row[3], :date_of_birth => row[4])
    end
  end
end
