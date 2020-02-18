class AddPayDayToLandingPages < ActiveRecord::Migration[5.2]
  def change
    add_column :landing_pages, :pay_day, :date
  end
end
