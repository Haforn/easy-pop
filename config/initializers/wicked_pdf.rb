if Rails.env.production?
  WickedPdf.config = {
    :exe_path => Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s
  }
else
  WickedPdf.config = {
    :exe_path => '/Users/bhoekstra/.rbenv/shims/wkhtmltopdf'
  }
end