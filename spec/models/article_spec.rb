require 'spec_helper'

describe Article do
  it{ should validate_presence_of(:title) }
  it{ should ensure_length_of(:title).is_at_most(410) }
end