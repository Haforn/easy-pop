if Rails.env.production?
  require 'rbconfig'

	if RbConfig::CONFIG['host_os'] =~ /linux/
	  arch = RbConfig::CONFIG['host_cpu'] == 'x86_64' ? 'wkhtmltopdf_linux_x64' : 'wkhtmltopdf_linux_386'
	elsif RbConfig::CONFIG['host_os'] =~ /darwin/
	  arch = 'wkhtmltopdf_darwin_386'
	else
	  raise "Invalid platform. Must be running Intel-based Linux or OSX."
	end

	WickedPdf.config = {
	  exe_path: "#{ENV['GEM_HOME']}/gems/wkhtmltopdf-binary-#{Gem.loaded_specs['wkhtmltopdf-binary'].version}/bin/#{arch}"
	}

  #WickedPdf.config = {
  	#exe_path: "#{ENV['GEM_HOME']}/gems/wkhtmltopdf-binary-#{Gem.loaded_specs['wkhtmltopdf-binary'].version}/bin/wkhtmltopdf_linux_386"
  #	:exe_path => '/usr/local/bin/wkhtmltopdf'
  #}
else
  WickedPdf.config = {
    :exe_path => '/Users/bhoekstra/.rbenv/shims/wkhtmltopdf'
  }
end