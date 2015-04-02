if Rails.env.production?
  WickedPdf.config = {
    :exe_path => '/usr/bin/wkhtmltopdf.sh'
  }
else
  WickedPdf.config = {
    :exe_path => '/Users/bhoekstra/.rbenv/shims/wkhtmltopdf'
  }
end