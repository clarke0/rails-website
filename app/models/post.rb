class Post
  POSTS_DIR = Rails.root.join("posts")

  attr_reader :title, :slug, :body, :published_at

  def initialize(title:, slug:, body:, published_at:)
    @title = title
    @slug = slug
    @body = body
    @published_at = published_at
  end

  def to_param
    slug
  end

  def self.all
    Dir.glob(POSTS_DIR.join("*.md"))
       .map { |path| load_file(path) }
       .sort_by(&:published_at)
       .reverse
  end

  def self.find_by!(slug:)
    path = POSTS_DIR.join("#{slug}.md")
    raise ActiveRecord::RecordNotFound unless File.exist?(path)
    load_file(path)
  end

  def self.load_file(path)
    raw = File.read(path)
    raise "Post #{path} is missing frontmatter" unless raw =~ /\A---\n(.*?)\n---\n(.*)/m

    frontmatter = YAML.safe_load($1, permitted_classes: [ Date ])
    body_html = Kramdown::Document.new($2).to_html
    new(
      title: frontmatter["title"],
      slug: File.basename(path, ".md"),
      published_at: Time.zone.parse(frontmatter["published_at"].to_s),
      body: body_html
    )
  end
  private_class_method :load_file
end
