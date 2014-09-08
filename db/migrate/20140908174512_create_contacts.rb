class CreateContacts < ActiveRecord::Migration
  def change
    # Create the contacts table with the following
    create_table :contacts do |table|
      # A column first_name of type string
      table.string :first_name

      # A column last_name of type string
      table.string :last_name

      # A column phone_number of type string
      table.string :phone_number
    end
  end
end
