# == Schema Information
#
# Table name: data_record_revisions
#
#  id             :bigint           not null, primary key
#  change         :text
#  status         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  data_record_id :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_data_record_revisions_on_data_record_id  (data_record_id)
#  index_data_record_revisions_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (data_record_id => data_records.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :data_record_revision do
    data_record { nil }
    user { nil }
    change { "MyText" }
    status { 1 }
  end
end
