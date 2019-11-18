require "application_system_test_case"

class DecksTest < ApplicationSystemTestCase
  setup do
    @deck = decks(:one)
  end

  test "visiting the index" do
    visit decks_url
    assert_selector "h1", text: "Decks"
  end

  test "creating a Deck" do
    visit decks_url
    click_on "New Deck"

    fill_in "Description", with: @deck.description
    check "Is private" if @deck.is_private
    fill_in "Name", with: @deck.name
    fill_in "Parent", with: @deck.parent_id
    fill_in "Rank", with: @deck.rank
    fill_in "Stars", with: @deck.stars
    fill_in "Theme", with: @deck.theme_id
    fill_in "Vitality", with: @deck.vitality
    click_on "Create Deck"

    assert_text "Deck was successfully created"
    click_on "Back"
  end

  test "updating a Deck" do
    visit decks_url
    click_on "Edit", match: :first

    fill_in "Description", with: @deck.description
    check "Is private" if @deck.is_private
    fill_in "Name", with: @deck.name
    fill_in "Parent", with: @deck.parent_id
    fill_in "Rank", with: @deck.rank
    fill_in "Stars", with: @deck.stars
    fill_in "Theme", with: @deck.theme_id
    fill_in "Vitality", with: @deck.vitality
    click_on "Update Deck"

    assert_text "Deck was successfully updated"
    click_on "Back"
  end

  test "destroying a Deck" do
    visit decks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Deck was successfully destroyed"
  end
end
