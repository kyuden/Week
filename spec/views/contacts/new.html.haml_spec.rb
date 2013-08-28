require 'spec_helper'

describe "contacts/new" do
  before(:each) do
    assign(:contact, stub_model(Contact,
      :name => "MyString",
      :adress => "MyString",
      :category => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contacts_path, "post" do
      assert_select "input#contact_name[name=?]", "contact[name]"
      assert_select "input#contact_adress[name=?]", "contact[adress]"
      assert_select "input#contact_category[name=?]", "contact[category]"
      assert_select "textarea#contact_description[name=?]", "contact[description]"
    end
  end
end
