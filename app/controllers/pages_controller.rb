class PagesController < ApplicationController
  def index
    if signed_in?
      @cards = Card.all
    end
  end
end
