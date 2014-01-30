class Abbrv8UrlController < ApplicationController
  def index
  end

  def create
    abbrv8_url = Abbrv8Url.create(long_url: params[:abbrv8_url][:long_url])
 
    @errors = abbrv8_url.errors
    @short_url = short_url(abbrv8_url.short_url) if @errors.empty?

    render action: :index
  end
end
