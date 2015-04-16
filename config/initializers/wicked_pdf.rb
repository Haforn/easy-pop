if Rails.env.production?
  WickedPdf.config = {
  	:exe_path => '/u/apps/easy_pop_production/shared/bundle/ruby/2.1.0/bin/wkhtmltopdf'
  }
else
  WickedPdf.config = {
    :exe_path => '/Users/bhoekstra/.rbenv/shims/wkhtmltopdf'
  }
end