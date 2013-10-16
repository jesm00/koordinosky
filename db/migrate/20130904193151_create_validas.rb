class CreateValidas < ActiveRecord::Migration
  def change
    create_table :validas, :id => false do |t|
	  t.belongs_to :curso
	  t.belongs_to :programa
      t.timestamps
    end
    add_index :validas, [:curso_id, :programa_id]
  end
end
