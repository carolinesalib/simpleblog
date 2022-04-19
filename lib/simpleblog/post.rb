class Post
  def self.build_list_of_posts(posts)
    posts.map do |id, post_content|
      Post.new(id, post_content)
    end
  end

  attr_reader :id, :post_content

  def initialize(id, post_content)
    @id = id
    @post_content = post_content
  end

  def tags
    post_content["tags"].gsub(/\s+/, "").split(",")
  end

  private

  def method_missing(method, *args, &block)
    if post_content[method.to_s]
      self.class.define_method(method.to_s) do
        post_content[method.to_s]
      end

      send method, *args, &block
    end
  end
end
