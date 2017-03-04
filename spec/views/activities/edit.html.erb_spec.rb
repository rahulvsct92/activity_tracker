require 'rails_helper'

RSpec.describe "activities/edit", type: :view do
  before(:each) do
    @activity = assign(:activity, Activity.create!(
      :duration => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit activity form" do
    render

    assert_select "form[action=?][method=?]", activity_path(@activity), "post" do

      assert_select "input#activity_duration[name=?]", "activity[duration]"

      assert_select "textarea#activity_description[name=?]", "activity[description]"
    end
  end
end
