class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :nitem
      t.string :xprod
      t.string :ncm
      t.string :cfop
      t.string :ucom
      t.string :qcom
      t.decimal :vuncom, precision: 10, scale: 2
      t.decimal :vicms, precision: 10, scale: 2
      t.decimal :vipi, precision: 10, scale: 2
      t.decimal :vpis, precision: 10, scale: 2
      t.decimal :vcofins, precision: 10, scale: 2
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
