class AddPasswordDigestToEstudiantes < ActiveRecord::Migration
  def change
    add_column :estudiantes, :password_digest, :string
  end
end
