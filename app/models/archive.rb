# frozen_string_literal: true

# == Schema Information
#
# Table name: archives
#
#  id           :bigint           not null, primary key
#  current      :date
#  device_token :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Archive < ApplicationRecord
  has_many :logs, dependent: :destroy

  after_create :stat

  def stat(date = Time.now)
    hour = date.in_time_zone("Caracas").strftime("%H")
    minute = date.in_time_zone("Caracas").strftime("%M")

    @device = Device.find_by(token: device_token)

    if @device.nil? 
      raise "Device not found"
    else
      minute_parse = minute.to_i < 30 ? "00" : "30"

      temperatures = {
        "09:30": 28.9,
        "10:00": 29.1,
        "10:30": 29.4,
        "11:00": 29.5,
        "11:30": 29.7,
        "12:00": 29.8,
        "12:30": 29.9,
        "13:00": 30.2,
        "13:30": 31.3,
        "14:00": 31.9,
        "14:30": 32.1,
        "15:00": 32.5,
        "15:30": 32.7,
        "16:00": 32.8,
        "16:30": 32.4,
        "17:00": 32.1,
        "17:30": 31.8,
        "18:00": 31.5,
        "18:30": 31.2,
        "19:00": 31.1,
        "19:30": 31.1,
        "20:00": 30.9,
        "20:30": 30.7,
        "21:00": 30.3,
      }

      humidity = {
        "09:30": 73.0,
        "10:00": 71.0,
        "10:30": 71.2,
        "11:00": 70.9,
        "11:30": 70.3,
        "12:00": 69.1,
        "12:30": 69.5,
        "13:00": 69.4,
        "13:30": 68.1,
        "14:00": 67.6,
        "14:30": 67.1,
        "15:00": 65.1,
        "15:30": 63.1,
        "16:00": 62.3,
        "16:30": 61.1,
        "17:00": 62.7,
        "17:30": 61.2,
        "18:00": 63.4,
        "18:30": 65.1,
        "19:00": 64.2,
        "19:30": 65.7,
        "20:00": 67.3,
        "20:30": 70.3,
        "21:00": 71.5,
      }

      current_temp = temperatures[:"#{hour}:#{minute_parse}"]
      current_hum = humidity[:"#{hour}:#{minute_parse}"]

      thermal_sensation = (0.994 * current_temp) + (0.0553 * current_hum)

      $redis.setex("auto:temp_daemon", 30.minutes.to_i, 1)
      
      Log.create(
        temperature: current_temp,
        humidity: current_hum,
        thermal_sensation: thermal_sensation.round(2),
        degree: 'C',
        device_id: 1,
        archive_id: Archive.last.id
      )
    end
  end
end
