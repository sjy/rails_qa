class CreateDataRecordRevisions < ActiveRecord::Migration[7.0]
  def change
    create_table :data_record_revisions do |t|
      t.references :data_record, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :change
      t.integer :status

      t.timestamps
    end
  end
end
