class NanoMetrics::Metric < ActiveRecord::Base
  self.table_name = 'nano_metrics'

  belongs_to :context

  validates :context, presence: true
  validates :time,    presence: true

  before_validation :set_time, on: :create

  private

  def set_time
    self.time ||= Time.zone.now
  end
end
