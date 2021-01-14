class LandingController < ApplicationController
  def index
    puts Movie.all.count
  end

  def test
    render json: { name: 'test' }
  end
end
