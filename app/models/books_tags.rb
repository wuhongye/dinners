class BlogsTags < ActiveRecord::Base

  self.table_name = 'books_tags'

  validates_uniqueness_of :book_id, scope: [:tag_id]

  belongs_to :book
  belongs_to :tag

end