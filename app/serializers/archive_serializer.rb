class ArchiveSerializer < ActiveModel::Serializer
  attributes :id, :current, :device_token, :created_at

  has_many :logs
end
