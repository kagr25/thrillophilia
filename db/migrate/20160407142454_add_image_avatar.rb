class AddImageAvatar < ActiveRecord::Migration
  def up
    add_attachment :images, :avatar
  end

  def down
    remove_attachment :images, :avatar
  end

end
