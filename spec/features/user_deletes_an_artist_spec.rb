require 'rails_helper'

RSpec.describe "A user can delete an artist" do
  context "from the show page" do
    it "when they click the delete button" do
      Artist.create(name: "Amanda Palmer", image_path: "http://www.thatericalper.com/wp-content/uploads/2017/03/amanda-palmer-1.jpg")
      Artist.create(name: "Janelle Monae", image_path: "http://toanmagazine.com/wp-content/uploads/2015/03/2011-topic-janelle-monae.png")

      visit artists_path

      expect(page).to have_content "Amanda Palmer"
      expect(page).to have_content "Janelle Monae"

      click_on "Amanda Palmer"
      click_on "Delete"

      expect(current_path).to eq(artists_path)
      expect(page).to_not have_content "Amanda Palmer"
      expect(page).to have_content "Janelle Monae"
    end
  end
end
