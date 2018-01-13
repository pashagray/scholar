class Advert < ApplicationRecord
  belongs_to :advertable, polymorphic: true
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, :content, presence: true
end