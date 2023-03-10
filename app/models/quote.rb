# == Schema Information
#
# Table name: quotes
#
#  id         :bigint           not null, primary key
#  author     :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_quotes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Quote < ApplicationRecord
  paginates_per 5

  belongs_to :user

  has_many :favourites, dependent: :destroy

  validates :author, presence: true
  validates :text, presence: true

  scope :most_liked, -> { left_joins(:favourites).group(:id).order("COUNT(favourites.id) DESC") }
end
