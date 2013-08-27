require 'spec_helper'

describe 'Saving metrics' do
  let(:user) { User.create! }

  it "saves a new value" do
    NanoMetrics.increment :view, user

    NanoMetrics::Context.for_action_and_metricable(:view, user).metrics.count.
      should == 1
  end

  it "saves new contexts if they don't exist" do
    NanoMetrics.increment :view, user

    NanoMetrics::Context.where(
      action: 'view', metricable_id: user.id, metricable_type: 'User'
    ).count.should == 1
  end

  it "re-uses existing contexts when appropriate" do
    NanoMetrics::Context.create action: :view, metricable: user

    NanoMetrics.increment :view, user

    NanoMetrics::Context.where(
      action: 'view', metricable_id: user.id, metricable_type: 'User'
    ).count.should == 1
  end
end
