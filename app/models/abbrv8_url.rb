class Abbrv8Url < ActiveRecord::Base
  validates :long_url, presence: true
  validate :url_format

  before_create :generate_short_url

  def generate_short_url
    begin
      random_string = /\d|\w{5}/.gen
    end while Abbrv8Url.where(short_url: random_string).any?

    self.short_url = random_string
  end

  def url_format
    URI.parse(self.long_url).kind_of?(URI::HTTP)
  end
end