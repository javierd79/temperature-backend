class ArchiveSerializer < ActiveModel::Serializer
  attributes :id, :current, :device_token, :created_at, :logs

  def logs
    object.logs.map do |log|
      {
        id: log.id,
        temperature: log.temperature,
        humidity: log.humidity,
        thermal_sensation: log.thermal_sensation,
        degree: log.degree,
        created_at: log.created_at
      }
    end
  end
end
