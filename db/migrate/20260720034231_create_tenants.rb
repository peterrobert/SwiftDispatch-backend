class CreateTenants < ActiveRecord::Migration[8.0]
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :subdomain
      t.string :company_email
      t.integer :status

      t.timestamps
    end
  end
end
