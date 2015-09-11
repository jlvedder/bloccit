class AddUnconfirmedToDevise < ActiveRecord::Migration
  # def change
  #   change_table(:users) do |t|
  #   # t.string :unconfirmed_email
  #   t.datetime :confirmed_at
  # end
  def change
    add_column :users, :confirmed_at, :datetime
  end
end
