require 'rails_helper'

RSpec.describe "activities/new", type: :view do
  before(:each) do
    assign(:activity, Activity.new(
      :duration => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new activity form" do
    render

    assert_select "form[action=?][method=?]", activities_path, "post" do

      assert_select "input#activity_duration[name=?]", "activity[duration]"

      assert_select "textarea#activity_description[name=?]", "activity[description]"
    end
  end
end
