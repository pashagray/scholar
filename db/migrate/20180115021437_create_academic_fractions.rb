class CreateAcademicFractions < ActiveRecord::Migration[5.1]
  def change
    create_table :academic_fractions do |t|
      t.string :title
      t.date :starts_on
      t.date :ends_on
      t.integer :academic_period_id

      t.timestamps
    end
  end
end
