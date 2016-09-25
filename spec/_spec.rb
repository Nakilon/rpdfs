require "pp"

require "bundler/setup"
Bundler.setup

# require_relative "../lib/rpdfs"


describe do

  # def method_missing *args
  #   described_class.send *args
  # end

  example "integrational" do
    require "tempfile"
    rpdfs_file = Tempfile.new "rpdfs"
    pdf_file = Tempfile.new "pdf"
    File.write rpdfs_file.path, "compile_slides *[
                                   *Array.new(10){{}},
                                   {_:[{_:??,bottom:2}]},
                                   {_:[?¿]},
                                 ]" # PDF::Reader does not see "?" if too close to the bottom ..(
    expect(`#{__dir__()}/../bin/rpdfs #{rpdfs_file.path} #{pdf_file.path}`).to eq("")
    require "pdf-reader"
    expect(PDF::Reader.new(pdf_file.path).pages.map(&:text)).to eq([*([""]*10), ??, ?¿])
  end

end
