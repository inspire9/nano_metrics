class CreateNanoMetricsTables < ActiveRecord::Migration
  def up
    create_table :nano_metrics do |t|
      t.integer  :context_id, null: false
      t.datetime :time,       null: false
      t.timestamps
    end

    add_index :nano_metrics, :context_id

    create_table :nano_contexts do |t|
      t.string  :action,         null: false
      t.string  :metricable_type, null: false
      t.integer :metricable_id,   null: false
    end

    add_index :nano_contexts, :action
    add_index :nano_contexts, [:metricable_type, :metricable_id]
    add_index :nano_contexts, [:action, :metricable_type, :metricable_id],
      unique: true, name: 'unique_nano_contexts'
  end

  def down
    drop_table :nano_contexts
    drop_table :nano_metrics
  end
end
