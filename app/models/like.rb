# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fan_id     :integer
#  photo_id   :integer
#
class Like < ApplicationRecord
  validates(:fan, { :presence => true })
  validates(:photo, { :presence => true })

  belongs_to :fan, class_name: 'User', foreign_key: 'fan_id'

  def fan
    return User.where({ :id => self.fan_id }).at(0)
  end

  def photo
    return Photo.where({ :id => self.photo_id }).at(0)
  end
end
