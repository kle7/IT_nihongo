class Bookmark < ApplicationRecord
	self.primary_key = :movie_id
	self.primary_key = :user_id

	belongs_to :user, foreign_key: :user_id
	belongs_to :movie, foreign_key: :movie_id
	def self.destroy_by_movie_id_and_user_id (movie_id,user_id)
		ActiveRecord::Base.connection.execute("delete from bookmarks where user_id="+user_id.to_s+" and movie_id="+movie_id.to_s+";")
	end
end
