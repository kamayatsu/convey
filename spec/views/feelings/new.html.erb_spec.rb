require 'rails_helper'

RSpec.describe "feelings/new", type: :view do
  before(:each) do
    assign(:feeling, Feeling.new)
  end

  it "renders new feeling form" do
    render

    assert_select "form[action=?][method=?]", feelings_path, "post" do
    end
  end
end
