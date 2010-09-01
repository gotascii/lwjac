class Comment
  include Ripple::Document
  property :author, String, :presence => true
  property :email, String, :presence => true
  property :url, String
  property :body, String, :presence => true

  def to_json
    attributes.merge("id" => key)
  end

  def self.all_to_json
    all.collect(&:to_json)
  end
end