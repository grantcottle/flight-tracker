require 'rails_helper'

RSpec.describe "flights/new", type: :view do
  before(:each) do
    assign(:flight, Flight.new(
      flight_number: 1,
      origin: nil,
      destination: nil,
      description: "MyString",
      duration: 1,
      stops: 1
    ))
  end

  it "renders new flight form" do
    render

    assert_select "form[action=?][method=?]", flights_path, "post" do

      assert_select "input[name=?]", "flight[flight_number]"

      assert_select "input[name=?]", "flight[origin_id]"

      assert_select "input[name=?]", "flight[destination_id]"

      assert_select "input[name=?]", "flight[description]"

      assert_select "input[name=?]", "flight[duration]"

      assert_select "input[name=?]", "flight[stops]"
    end
  end
end
