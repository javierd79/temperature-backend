# == Schema Information
#
# Table name: logs
#
#  id                :bigint           not null, primary key
#  degree            :string
#  humidity          :float
#  temperature       :float
#  thermal_sensation :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  archive_id        :bigint           not null
#  device_id         :bigint           not null
#
# Indexes
#
#  index_logs_on_archive_id  (archive_id)
#  index_logs_on_device_id   (device_id)
#
# Foreign Keys
#
#  fk_rails_...  (archive_id => archives.id)
#  fk_rails_...  (device_id => devices.id)
#
require "test_helper"

class LogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
