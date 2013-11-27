class User < ActiveRecord::Base
  validates :last_name, :first_name, presence: true

  def self.import(file)
    csv = File.open(file.path, 'rb')
    contents = file.read
    
    if contents.include?("|")
      sep = '|'
    elsif contents.include?("\t")
      sep = "\t"
    else
      sep = ","
    end
      
    CSV.open(file.path, 'r', { :col_sep => "#{sep}", :headers => true}).each do |row|
      User.create(:last_name => row[0], :first_name => row[1], :gender => row[2],
        :date_of_birth => row[3], :favorite_color => row[4])
    end
  end
end
