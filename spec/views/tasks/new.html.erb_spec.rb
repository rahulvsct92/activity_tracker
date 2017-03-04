require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :planned_hours => 1,
      :status => 1
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_planned_hours[name=?]", "task[planned_hours]"

      assert_select "input#task_status[name=?]", "task[status]"
    end
  end
end
