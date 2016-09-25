require "pp"

# require_relative "../lib/rpdfs"


describe do

  # def method_missing *args
  #   described_class.send *args
  # end

  example "integrational" do
    require "tempfile"
    rpdfs_file = Tempfile.new "rpdfs"
    pdf_file = Tempfile.new "pdf"
    File.write rpdfs_file.path, "compile_slides 123, 234"
    expect(`#{__dir__()}/../bin/rpdfs #{rpdfs_file.path} #{pdf_file.path}`).to eq("")
    expect(File.read pdf_file.path).to eq("123234")
  end

end
