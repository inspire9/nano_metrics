class NanoMetrics::Context < ActiveRecord::Base
  self.table_name = 'nano_contexts'

  has_many :metrics, class_name: 'NanoMetrics::Metric'
  belongs_to :metricable, polymorphic: true

  def self.find_or_create(action, metricable)
    for_action_and_metricable(action, metricable) || create(
      action:     action,
      metricable: metricable
    )
  end

  def self.for_action_and_metricable(action, metricable)
    where(
      action:          action,
      metricable_id:   metricable.id,
      metricable_type: metricable.class.name
    ).first
  end
end
