class AddImgToDecks < ActiveRecord::Migration[6.0]
  def change
     add_column :decks, :photo, :string, :default => "https://images.unsplash.com/photo-1513710281312-7a43f9cdbfcc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
  end
end
