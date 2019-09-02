class CreateTestmodels < ActiveRecord::Migration[6.0]
  def change
    create_table :testmodels do |t|

      t.timestamps
    end
  end
end
