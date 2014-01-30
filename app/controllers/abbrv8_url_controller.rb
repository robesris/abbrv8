class Abbrv8UrlController < ApplicationController
  def index
  end

  def create
    abbrv8_url = Abbrv8Url.create(long_url: params[:abbrv8_url][:long_url])

    render action: :index
  end
end
