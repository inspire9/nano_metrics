module NanoMetrics
  def self.increment(action, object)
    NanoMetrics::Context.find_or_create(action, object).metrics.create(
      time: Time.zone.now
    )
  end
end

require 'nano_metrics/engine'
