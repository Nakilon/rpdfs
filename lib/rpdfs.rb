module RPDFS
  VERSION = "0.0.0.0"
  attr_accessor :last_generated_html
  def compile_slides *slides
    self.last_generated_html = "<html><body>#{slides.join}</body></html>"
  end
end
