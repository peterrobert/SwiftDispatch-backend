class AddIndexesToTenants < ActiveRecord::Migration[8.0]
  def change
    add_index :tenants, :subdomain, unique: true
    add_index :tenants, :company_email, unique: true

    change_column_null :tenants, :name, false
    change_column_null :tenants, :subdomain, false
    change_column_null :tenants, :status, false, 0
  end
end
