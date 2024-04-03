# frozen_string_literal: true

# rubocop :disable all
class DeviceList
  def variants(device)
    case device
    when 'DHT11'
      return {
        max_temp: 80.0,
        min_temp: 0,
        temp_variable: 2.0,
        temp_unit: 'C',
        max_hum: 100.0,
        min_hum: 0,
        hum_variable: 2.0,
        hum_unit: '%',
        hz_rate: 0.5
      }
    when 'DHT22'
      return {
        max_temp: 500.0,
        min_temp: 0,
        temp_variable: 0.5,
        temp_unit: 'C',
        max_hum: 100.0,
        min_hum: 0,
        hum_variable: 0.5,
        hum_unit: '%',
        hz_rate: 2.0
      }
    else
      raise 'Invalid device'
    end
  end
end
