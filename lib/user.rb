class User
	attr_accessor :last_name, :first_name, :gender, :date_of_birth, :favorite_color

	def initialize
		@last_name = 'jackson'
		@first_name = 'michael'
		@gender = 'M'
		@favorite_color = 'red'
    @date_of_birth = '08-29-1958'
	end
end