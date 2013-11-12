class CreateEscenarios < ActiveRecord::Migration
  def change
    create_table :escenarios do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
