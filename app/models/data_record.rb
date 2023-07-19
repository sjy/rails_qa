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
  has_many :data_record_revisions, dependent: :destroy

  def update_from_revision(revision)
    if revision.change
      # 根据修订版的更改更新数据记录
      update_attribute(:value, revision.change)
    end
  end
end
