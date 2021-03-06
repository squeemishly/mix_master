require 'rails_helper'

RSpec.describe "A user can create a playlist" do
  context "when they click on new playlist" do
    it "they can add songs to a playlist" do
      artist = create(:artist)
      song = create(:song)
      song2 = create(:song)

      visit playlists_path
      click_on "New Playlist"

      fill_in "playlist_title", with: "rock out"
      page.check("song-#{song.id}")
      page.check("song-#{song2.id}")
      click_on "Create Playlist"

      expect(page).to have_content "rock out"

      within("li:first") do
        expect(page).to have_link song.title, href: song_path(song)
      end

      within("li:last") do
        expect(page).to have_link song2.title, href: song_path(song2)
      end
    end
  end
end
