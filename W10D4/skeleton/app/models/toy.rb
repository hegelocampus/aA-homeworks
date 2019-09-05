# == Schema Information
#
# Table name: toys
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  toyable_type :string
#  toyable_id   :bigint
#

class Toy < ApplicationRecord
  validates :name, uniqueness: { scope: [:toyable] }

  belongs_to :toyable, polymorphic: true
end
