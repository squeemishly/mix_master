require 'rails_helper'

RSpec.describe "A user can see all artists in the database" do
  context "when they load the home artists page" do
    scenario "they can see all the artists" do
      Artist.create(name: "Amanda Palmer", image_path: "http://www.thatericalper.com/wp-content/uploads/2017/03/amanda-palmer-1.jpg")
      Artist.create(name: "Janelle Monae", image_path: "http://toanmagazine.com/wp-content/uploads/2015/03/2011-topic-janelle-monae.png")

      visit artists_path

      expect(page).to have_content "All Artists"
      expect(page).to have_content "Amanda Palmer"
      expect(page).to have_content "Janelle Monae"
    end
  end

  context "when a user clicks an artists name, " do
      scenario "it takes them to that artists individual page" do
      Artist.create(name: "Amanda Palmer", image_path: "http://www.thatericalper.com/wp-content/uploads/2017/03/amanda-palmer-1.jpg")
      Artist.create(name: "Janelle Monae", image_path: "http://toanmagazine.com/wp-content/uploads/2015/03/2011-topic-janelle-monae.png")

      visit artists_path

      click_on "Amanda Palmer"

      expect(page).to have_content "Amanda Palmer"
      expect(page).to have_css("img[src*='http://www.thatericalper.com/wp-content/uploads/2017/03/amanda-palmer-1.jpg']")

      expect(page).to_not have_content "Janelle Monae"
    end
  end
end
