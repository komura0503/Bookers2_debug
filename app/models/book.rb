class Book < ApplicationRecord
	belongs_to :user
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
	end

	def self.looks(methods,contents)
	    if methods == "perfect_match"
	      @book = Book.where("title LIKE ?", "#{contents}")
	    else
	      @book = Book.where("title LIKE ?", "%#{contents}%")
	    end
	end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
