class CreateOfertas < ActiveRecord::Migration
  def change
    create_table :ofertas do |t|
      t.integer :cupos
	  t.belongs_to :curso
      t.belongs_to :escenario
      t.timestamps
    end
  end
end
