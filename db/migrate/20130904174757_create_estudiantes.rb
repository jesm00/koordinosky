class CreateEstudiantes < ActiveRecord::Migration
  def change
    create_table :estudiantes do |t|
      t.string :nombre
      t.string :email
      t.integer :semestre_actual
      t.belongs_to :programa

      t.timestamps
    end
  end
end
