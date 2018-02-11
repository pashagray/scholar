class Advert < ApplicationRecord
  belongs_to :advertable, polymorphic: true
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, :content, presence: true

  acts_as_notifiable :users, targets: ->(advert, key) { advert.advertable.subscribers - [advert.author] }
end
