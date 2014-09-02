require 'test_helper'

class LineCardsControllerTest < ActionController::TestCase
  setup do
    @line_card = line_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_card" do
    assert_difference('LineCard.count') do
      post :create, line_card: { card_id: @line_card.card_id, team_id: @line_card.team_id }
    end

    assert_redirected_to line_card_path(assigns(:line_card))
  end

  test "should show line_card" do
    get :show, id: @line_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_card
    assert_response :success
  end

  test "should update line_card" do
    patch :update, id: @line_card, line_card: { card_id: @line_card.card_id, team_id: @line_card.team_id }
    assert_redirected_to line_card_path(assigns(:line_card))
  end

  test "should destroy line_card" do
    assert_difference('LineCard.count', -1) do
      delete :destroy, id: @line_card
    end

    assert_redirected_to line_cards_path
  end
end
