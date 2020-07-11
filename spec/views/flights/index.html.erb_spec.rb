require 'rails_helper'

RSpec.describe "flights/index", type: :view do
  before(:each) do
    assign(:flights, [
      Flight.create!(
        flight_number: 2,
        origin: nil,
        destination: nil,
        description: "Description",
        duration: 3,
        stops: 4
      ),
      Flight.create!(
        flight_number: 2,
        origin: nil,
        destination: nil,
        description: "Description",
        duration: 3,
        stops: 4
      )
    ])
  end

  it "renders a list of flights" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
  end
end
