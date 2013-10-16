class AddRememberTokenToEstudiantes < ActiveRecord::Migration
  def change
  	add_column :estudiantes, :remember_token, :string
    add_index  :estudiantes, :remember_token
  end
end
    