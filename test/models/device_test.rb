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
require "test_helper"

class DeviceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
