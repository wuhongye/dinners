class Book < ActiveRecord::Base

  validates :user_id, presence: { message: "用户不能为空" }
  validates :meal, presence: { message: "菜名不能为空" }
  validates :times, presence: { message: "具体时间" }
  validates :day, presence: { message: "上/下午" }
  validates :payer, presence: { message: "付款人" }

  belongs_to :user
  has_many :books_tags, class_name: "BooksTags"
  has_many :tags, through: :books_tags


  def tags_string= one_tags
    self.tags.destroy_all

    one_tags.split(',').each do |tag|
      one_tag = Tag.find_by(title: tag)
      one_tag = Tag.new(title: tag) unless one_tag

      self.tags << one_tag
    end
  end

end