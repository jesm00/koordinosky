class CreatePensums < ActiveRecord::Migration
  def change
    create_table :pensums, :id => false do |t|
	  t.belongs_to :curso
	  t.belongs_to :programa
      t.integer :semestre
      t.timestamps
    end
    add_index :pensums, [:curso_id, :programa_id]
  end
end
