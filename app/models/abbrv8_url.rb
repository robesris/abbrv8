class Abbrv8Url < ActiveRecord::Base
  validates :long_url, presence: true, allow_blank: false
  validates :short_url, uniqueness: true
  validates_formatting_of :long_url, using: :url

  before_validation :standardize_long_url, :generate_short_url

  has_many :visits 

  def standardize_long_url
    unless self.long_url[0..6] == "http://" || self.long_url[0..7] == "https://"
      self.long_url = "http://" + self.long_url
    end
  end

  def generate_short_url
    begin
      random_string = /\d|\w{5}/.gen
    end while Abbrv8Url.where(short_url: random_string).any?

    self.short_url = random_string
  end

  def self.error_message
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