class CreateRapnsNotifications < ActiveRecord::Migration
  def self.up
    create_table :rapns_notifications do |t|
      t.integer   :badge,                 :null => true
      t.string    :device_token,          :null => false, :limit => 64
      t.string    :sound,                 :null => true
      t.string    :alert,                 :null => true
      t.text      :attributes_for_device, :null => true
      t.integer   :expiry,                :null => false, :default => 1.day.to_i
      t.boolean   :delivered,             :null => false, :default => false
      t.timestamp :delivered_at,          :null => true
      t.timestamps
    end

    add_index :rapns_notifications, :delivered
  end

  def self.down
    drop_table :rapns_notifications
  end
end