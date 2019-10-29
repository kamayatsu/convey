require 'rails_helper'

RSpec.describe "feelings/show", type: :view do
  before(:each) do
    @feeling = assign(:feeling, Feeling.create!)
  end

  it "renders attributes in <p>" do
    render
  end
end
