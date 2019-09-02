# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  year       :integer          not null
#  live       :boolean          default(FALSE), not null
#  band_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :name, :year, :live, presence: true
  validates :year, numericality: { greater_than: 1888}
  validates :band_id, inclusion: { in: Band.all.map(&:id) } # I'w worried about this becoming a very slow chunk of code
  belongs_to :band
end
