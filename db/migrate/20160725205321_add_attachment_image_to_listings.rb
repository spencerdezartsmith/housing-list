class AddAttachmentImageToListings < ActiveRecord::Migration
    def up
      add_attachment :listings, :image
    end

    def down
      remove_attachment :listings, :image
    end
end
