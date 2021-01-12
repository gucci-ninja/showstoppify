class LandingController < ApplicationController
  def index
  end

  def test
    render json: { name: 'test' }
  end
end
