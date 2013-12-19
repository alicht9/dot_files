require 'rubygems'
require 'irb/completion'
require "./color.rb"

IRB.conf[:PROMPT_MODE] = :SIMPLE

IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File::expand_path("~/.irbhistory")

class Object
  def meth
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end


puts "Ruby Version #{RUBY_VERSION}"
