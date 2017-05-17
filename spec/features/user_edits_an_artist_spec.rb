require 'rails_helper'

RSpec.describe "When a user wants to edit an artist's information" do
  context "they find an Edit button on the artist's page" do
    scenario "and they click on the Edit button" do
      Artist.create(name: "Amanda Palmer", image_path: "http://www.thatericalper.com/wp-content/uploads/2017/03/amanda-palmer-1.jpg")
      Artist.create(name: "Janelle Monae", image_path: "http://toanmagazine.com/wp-content/uploads/2015/03/2011-topic-janelle-monae.png")

      visit artists_path

      click_on "Amanda Palmer"
      click_on "Edit"

      fill_in "artist_name", with: "Amanda and Jack Palmer"
      click_on "Update Artist"

      expect(page).to have_content("Amanda and Jack Palmer")
    end
  end
end
