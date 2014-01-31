class Abbrv8UrlController < ApplicationController
  def index
  end

  def create
    abbrv8_url = Abbrv8Url.create(long_url: params[:abbrv8_url][:long_url])
 
    @short_url = short_url(abbrv8_url.short_url) if abbrv8_url.errors.empty?
    @error_messages = abbrv8_url.errors.full_messages

    render action: :index
  end
end
