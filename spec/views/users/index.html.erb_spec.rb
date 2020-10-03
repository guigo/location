require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :role => 2,
        :name => ""
      ),
      User.create!(
        :role => 2,
        :name => ""
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end