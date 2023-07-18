# == Schema Information
#
# Table name: data_records
#
#  id         :bigint           not null, primary key
#  name       :string
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DataRecord < ApplicationRecord
  has_many :data_record_revisions
end
