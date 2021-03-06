require 'pg'
require 'uri'

class Link

  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map do |row|
      Link.new(row['id'], row['url'], row['title'])
    end
  end

  def self.add_new_link(new_link, title)
    return false unless validate(new_link)
    DatabaseConnection.query("INSERT INTO links(url, title) VALUES('#{new_link}', '#{title}');")
  end

  def self.delete(link_id)
    p "inside the delete method"
    p "link_id i s#{link_id}"
    DatabaseConnection.query("DELETE FROM links WHERE id='#{link_id.to_i}';")
  end

  def self.find(link_id)
    result = DatabaseConnection.query("SELECT * FROM links WHERE id='#{link_id}'")
    db_entry =  result.[](0)
    Link.new(db_entry["id"], db_entry["url"], db_entry["title"])
  end

  # def self.update(id, url, title)
  #   DatabaseConnection.query()
  # end

  def self.update(options)
    DatabaseConnection.query("UPDATE links SET url = '#{options[:url]}', title = '#{options[:title]}' WHERE id = '#{options[:id]}'")
  end

  private

  def self.validate(uri)
    uri = URI.parse(uri)
    uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
  end
end
