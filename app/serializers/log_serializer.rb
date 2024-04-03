class LogSerializer < ActiveModel::Serializer
  attributes :id, :degree, :humidity, :temperature, :thermal_sensation, :created_at

  belongs_to :archive
end
