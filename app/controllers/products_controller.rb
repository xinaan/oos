class ProductsController < ApplicationController
  layout "admin"
  def index
    @products = Product.all
  end

  def show

  end

  def edit
  end

  def delete
  end
end
