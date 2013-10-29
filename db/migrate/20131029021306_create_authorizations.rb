class CreateAuthorizations < ActiveRecord::Migration
  def up
    create_table :authorizations do |t|
      t.string :provider
      t.string :uid

      t.timestamps
    end

    def down
      remove_table :authorizations
    end
  end
end
