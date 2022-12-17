# == Schema Information
#
# Table name: quotes
#
#  id         :bigint           not null, primary key
#  author     :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Quote < ApplicationRecord
  validates :author, presence: true
  validates :text, presence: true
end
