require 'test_helper'

class DecksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deck = decks(:one)
  end

  test "should get index" do
    get decks_url
    assert_response :success
  end

  test "should get new" do
    get new_deck_url
    assert_response :success
  end

  test "should create deck" do
    assert_difference('Deck.count') do
      post decks_url, params: { deck: { description: @deck.description, is_private: @deck.is_private, name: @deck.name, parent_id: @deck.parent_id, rank: @deck.rank, stars: @deck.stars, theme_id: @deck.theme_id, vitality: @deck.vitality } }
    end

    assert_redirected_to deck_url(Deck.last)
  end

  test "should show deck" do
    get deck_url(@deck)
    assert_response :success
  end

  test "should get edit" do
    get edit_deck_url(@deck)
    assert_response :success
  end

  test "should update deck" do
    patch deck_url(@deck), params: { deck: { description: @deck.description, is_private: @deck.is_private, name: @deck.name, parent_id: @deck.parent_id, rank: @deck.rank, stars: @deck.stars, theme_id: @deck.theme_id, vitality: @deck.vitality } }
    assert_redirected_to deck_url(@deck)
  end

  test "should destroy deck" do
    assert_difference('Deck.count', -1) do
      delete deck_url(@deck)
    end

    assert_redirected_to decks_url
  end
end
