module RPDFS
  VERSION = "0.0.0.0"
  attr_accessor :last_generated_html
  def compile_slides *slides
    self.last_generated_html =
      "<html><meta charset='UTF-8' /><body style='margin: 0;'>" +
      slides.map.with_index do |slide, i|
        "<div style='width: 400px; height: 300px; position: absolute; top: #{300 * i}px;#{
          " box-shadow: inset 0 0 0 10px #{%w{lightgreen coral}[i % 2]};" if ENV["DEBUG"]
        }'>" +
        slide.fetch(:_, []).map do |_|
          content, style = if _.is_a? Hash
            [_[:_], _.keep_if{ |k,| %i{ bottom }.include? k }.merge({position: :absolute})]
          else
            _
          end
          "<div style='#{style.map{ |k, v| "#{k}: #{v == v.to_s.to_f ? "#{400 / 100.0 * v}px" : v};" }.join " " if style}'>#{content}</div>"
        end.join +
        "</div>"
      end.join +
      "</body></html>"
    if ENV["DEBUG"]
      File.write "debug.html", self.last_generated_html
      system "open debug.html" if Gem::Platform.local.os == "darwin"
    end
  end
end
