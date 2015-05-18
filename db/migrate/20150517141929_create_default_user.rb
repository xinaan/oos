class CreateDefaultUser < ActiveRecord::Migration
  def up
	user = User.create( username: 'admin', password: '123@abc', password_confirmation: '123@abc')
  end

  def down
	user = User.find_by_username( 'admin' )
    user.destroy
  end
end
