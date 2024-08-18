class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices do |t|
      t.string :serie
      t.string :nnf
      t.datetime :dhemi
      t.string :emit
      t.string :xnome
      t.decimal :total_vnf, precision: 10, scale: 2
      t.decimal :total_vtotrib, precision: 10, scale: 2

      t.timestamps
    end
  end
end
