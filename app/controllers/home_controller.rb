class HomeController < ApplicationController
  layout 'application'
  def index
    @products = Product.active.limit(9)
    @categories = Category.main
  end

end
