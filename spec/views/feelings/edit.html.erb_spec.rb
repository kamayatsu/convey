require 'rails_helper'

RSpec.describe "feelings/edit", type: :view do
  before(:each) do
    @feeling = assign(:feeling, Feeling.create!)
  end

  it "renders the edit feeling form" do
    render

    assert_select "form[action=?][method=?]", feeling_path(@feeling), "post" do
    end
  end
end
