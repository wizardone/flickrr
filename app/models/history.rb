class History < ActiveRecord::Base
  belongs_to :user

  scope :ordered, -> { order('id desc') }

  after_create :remove_old_history

  private

  def remove_old_history
    last_ids = user.histories.order('id desc').limit(10).pluck(:id)
    user.histories.where.not(id: last_ids).destroy_all
  end
end
