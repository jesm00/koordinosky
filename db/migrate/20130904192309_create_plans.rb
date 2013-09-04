class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans, :id => false do |t|
	  t.belongs_to :curso
	  t.belongs_to :estudiante
      t.timestamps
    end
    add_index :plans, [:curso_id, :estudiante_id]
  end
end
