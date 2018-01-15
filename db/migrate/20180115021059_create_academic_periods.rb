class CreateAcademicPeriods < ActiveRecord::Migration[5.1]
  def change
    create_table :academic_periods do |t|
      t.string :title

      t.timestamps
    end
  end
end
