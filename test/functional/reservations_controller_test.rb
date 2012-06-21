require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase
  setup do
    @reservation = reservations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reservation" do
    assert_difference('Reservation.count') do
      post :create, reservation: { cache_end_time: @reservation.cache_end_time, cache_start_time: @reservation.cache_start_time, exchange_event_id: @reservation.exchange_event_id, package_id: @reservation.package_id, person_id: @reservation.person_id, questionnaire_response_id: @reservation.questionnaire_response_id, recurrence_id: @reservation.recurrence_id, resource_id: @reservation.resource_id }
    end

    assert_redirected_to reservation_path(assigns(:reservation))
  end

  test "should show reservation" do
    get :show, id: @reservation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reservation
    assert_response :success
  end

  test "should update reservation" do
    put :update, id: @reservation, reservation: { cache_end_time: @reservation.cache_end_time, cache_start_time: @reservation.cache_start_time, exchange_event_id: @reservation.exchange_event_id, package_id: @reservation.package_id, person_id: @reservation.person_id, questionnaire_response_id: @reservation.questionnaire_response_id, recurrence_id: @reservation.recurrence_id, resource_id: @reservation.resource_id }
    assert_redirected_to reservation_path(assigns(:reservation))
  end

  test "should destroy reservation" do
    assert_difference('Reservation.count', -1) do
      delete :destroy, id: @reservation
    end

    assert_redirected_to reservations_path
  end
end
