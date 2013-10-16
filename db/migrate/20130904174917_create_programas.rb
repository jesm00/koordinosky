class CreateProgramas < ActiveRecord::Migration
  def change
    create_table :programas do |t|
      t.string :nombre
      t.boolean :es_maestria
      t.integer :duracion

      t.timestamps
    end
  end
end
