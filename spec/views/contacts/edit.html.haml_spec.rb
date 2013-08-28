require 'spec_helper'

describe "contacts/edit" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact,
      :name => "MyString",
      :adress => "MyString",
      :category => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do
      assert_select "input#contact_name[name=?]", "contact[name]"
      assert_select "input#contact_adress[name=?]", "contact[adress]"
      assert_select "input#contact_category[name=?]", "contact[category]"
      assert_select "textarea#contact_description[name=?]", "contact[description]"
    end
  end
end
