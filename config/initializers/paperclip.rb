=begin
class Paperclip::CommandLine
  def full_path(binary)
    [self.class.path, binary].compact.join((File::ALT_SEPARATOR||File::SEPARATOR))
  end
end if defined?(Paperclip::CommandLine)
=end
#Paperclip.options[:command_path] = 'C:\Program Files (x86)\GnuWin32\bin'
#Paperclip.options[:command_path] = "/usr/local/bin/identify"
#Paperclip.options[:command_path] = "C:\\Program Files\\ImageMagick-7.0.7-Q16"

