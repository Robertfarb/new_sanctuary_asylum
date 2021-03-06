class Review < ApplicationRecord
  belongs_to :draft
  belongs_to :user

  VALIDATION_MESSAGE = "You already have a review for this draft"

  validates :user_id, uniqueness: { scope: :draft_id,
                                 message: VALIDATION_MESSAGE }

  scope :by_user, ->(user) {
    where(user: user)
  }

  def authored_by?(user)
    !self.user.nil? && self.user == user
  end
end
