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
FactoryBot.define do
  factory :data_record do
    name { "MyString" }
    value { "MyString" }
  end
end
