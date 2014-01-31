class Abbrv8UrlController < ApplicationController
  def index
  end

  def create
    abbrv8_url = Abbrv8Url.create(long_url: params[:abbrv8_url][:long_url])
 
    if abbrv8_url.errors.empty?
      @short_url = short_url(abbrv8_url.short_url) 
    else
      @error_messages = abbrv8_url.errors.full_messages << Abbrv8Url.error_message
    end

    render action: :index
  end

  def go_to_short_url
    abbrv8_url = Abbrv8Url.where(short_url: params[:short_url]).first

    if abbrv8_url
      redirect_to abbrv8_url.long_url
    else
      redriect_to action: :index
    end
  end
end
