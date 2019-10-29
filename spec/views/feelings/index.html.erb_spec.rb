require 'rails_helper'

RSpec.describe "feelings/index", type: :view do
  before(:each) do
    assign(:feelings, [
             Feeling.create!,
             Feeling.create!
           ])
  end

  it "renders a list of feelings" do
    render
  end
end
