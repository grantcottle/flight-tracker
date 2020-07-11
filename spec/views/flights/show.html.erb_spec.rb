require 'rails_helper'

RSpec.describe "flights/show", type: :view do
  before(:each) do
    @flight = assign(:flight, Flight.create!(
      flight_number: 2,
      origin: nil,
      destination: nil,
      description: "Description",
      duration: 3,
      stops: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
