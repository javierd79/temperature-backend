# frozen_string_literal: true

# == Schema Information
#
# Table name: devices
#
#  id         :bigint           not null, primary key
#  is_active  :boolean          default(TRUE)
#  model      :string
#  token      :string
#  variant    :jsonb            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Device < ApplicationRecord
  has_many :logs, dependent: :destroy

  before_create :initialize_stats

  enum :model, {
    DHT11: 'DHT11',
    DHT22: 'DHT22'
  }

  validates :model,
            presence: true

  def self.change_active
    device = Device.last

    device.update(is_active: device.is_active ? false : true)

    return { message: "Device is now #{device.is_active ? 'active' : 'inactive'}", device: device }
  end

  private

  def initialize_stats
    self.token = SecureRandom.uuid
    self.variant = DeviceList.new.variants(model)
  end
end
