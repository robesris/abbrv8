class Abbrv8UrlController < ApplicationController
  def index
  end

  def create
    Abbrv8Url.create(params[:long_url])
  end
end
