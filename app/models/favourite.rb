# == Schema Information
#
# Table name: favourites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quote_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_favourites_on_quote_id  (quote_id)
#  index_favourites_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (quote_id => quotes.id)
#  fk_rails_...  (user_id => users.id)
#
class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :quote
end
