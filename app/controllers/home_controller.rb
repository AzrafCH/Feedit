class HomeController < ApplicationController

  def index
    @subfeds = Subfed.all
  end
end
