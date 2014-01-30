class Abbrv8Url < ActiveRecord::Base
  validates :long_url, presence: true, allow_blank: false
  validate :url_format

  before_create :generate_short_url

  def generate_short_url
    begin
      random_string = /\d|\w{5}/.gen
    end while Abbrv8Url.where(short_url: random_string).any?

    self.short_url = random_string
  end

  def url_format
    self.errors.add(:base, url_error_message) unless URI.parse(self.long_url).kind_of?(URI::HTTP)
  end

  private

  def url_error_message
    case rand(5)
    when 0
      "Seriously?"
    when 1
      "Um...are you sure you typed that right?"
    when 2
      "That doesn't look like a url to me.  But then what do I know, I'm just the internet..."
    when 3
      "Nope."
    when 4
      "LOL nice try"
    end
  end
end