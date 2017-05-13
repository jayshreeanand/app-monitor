class PagesController < ApplicationController
  layout 'pages', only: [:home]

  def home
  end
end
