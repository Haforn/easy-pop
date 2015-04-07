if Rails.env.production?
  WickedPdf.config = {
  	:exe_path => '/usr/local/bin/wkhtmltopdf'
  }
else
  WickedPdf.config = {
    :exe_path => '/Users/bhoekstra/.rbenv/shims/wkhtmltopdf'
  }
end