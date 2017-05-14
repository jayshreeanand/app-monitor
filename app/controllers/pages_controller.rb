class PagesController < ApplicationController
  skip_before_filter :authenticate_user!
  layout 'pages', only: [:home]

  def home
  end
end
