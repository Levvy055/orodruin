class AddUuidPsqlExtenstion < ActiveRecord::Migration
  def up
    enable_extension 'uuid-ossp'
  end

  def down
    enable_extension 'uuid-ossp'
  end
end
