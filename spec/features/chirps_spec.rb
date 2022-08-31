require 'rails_helper'

feature 'creating a Chirp', type: :feature do
    before :each do
        create(:user)
        visit new_chirp_url
    end

    scenario "takes a body" do
        expect(page).to have_content "New chirp"
        expect(page).to have_content "Body"
    end

    scenario "takes us back to chirp show page" do
        log_in_user(User.last)
        make_chirp("it's raining")
        # save_and_open_page

        expect(page).to have_content "it's raining"
        expect(current_path).to eq(chirp_path(Chirp.last))
    end
end