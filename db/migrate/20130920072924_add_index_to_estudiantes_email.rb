class AddIndexToEstudiantesEmail < ActiveRecord::Migration
  def change
    add_index :estudiantes, :email, unique: true
  end
end
