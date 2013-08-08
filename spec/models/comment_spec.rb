require 'spec_helper'

describe Comment do
  it{ should belong_to(:article) }
  it{ should validate_presence_of(:body) }

  it{ should ensure_length_of(:body).is_at_most(310) }
end