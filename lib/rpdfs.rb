module RPDFS
  VERSION = "0.0.0.1"
  attr_accessor :last_generated_html
  def compile_slides *slides
    # html_file = Tempfile.new
    # File.write html_file.path, slides.join
    # last_generated_html = File.read html_file
    self.last_generated_html = slides.join
  end
end
