class CreateCursadas < ActiveRecord::Migration
  def change
    create_table :cursadas, :id => false do |t|
	  t.belongs_to :curso
	  t.belongs_to :estudiante
      t.timestamps
    end
    add_index :cursadas, [:curso_id, :estudiante_id]
  end
end
