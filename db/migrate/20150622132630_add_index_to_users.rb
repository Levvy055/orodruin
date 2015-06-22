class AddIndexToUsers < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE UNIQUE INDEX index_users_on_lowercase_nickname
      ON users USING btree (LOWER(nickname));
    SQL
  end
  def down
    execute 'DROP INDEX index_users_on_lowercase_nickname;'
  end
end
