class AddFormulasToJournal < ActiveRecord::Migration[5.1]
  def change
    add_column :journals, :fraction_grading_formula, :string
    add_column :journals, :period_grading_formula, :string
    add_column :journals, :grading_system, :string
  end
end
