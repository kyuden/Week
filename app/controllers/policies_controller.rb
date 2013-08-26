class PoliciesController < ApplicationController
  skip_before_filter :check_logined
  layout 'nav'

  def terms
  end

  def privacy
  end
end
