class Tag < ActiveRecord::Base

  validates :title, uniqueness: { message: "标签已存在" }

  has_many :books_tags, class_name: "BooksTags"
  has_many :books, through: :books_tags

end