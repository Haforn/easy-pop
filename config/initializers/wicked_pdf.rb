if Rails.env.production?
  WickedPdf.config = {
  	exe_path: "#{ENV['GEM_HOME']}/gems/wkhtmltopdf-binary-#{Gem.loaded_specs['wkhtmltopdf-binary'].version}/bin/wkhtmltopdf_linux_386"
  }
else
  WickedPdf.config = {
    :exe_path => '/Users/bhoekstra/.rbenv/shims/wkhtmltopdf'
  }
end