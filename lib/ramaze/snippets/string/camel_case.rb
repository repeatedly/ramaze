#          Copyright (c) 2006 Michael Fellinger m.fellinger@gmail.com
# All files in this distribution are subject to the terms of the Ruby license.
class String
  def camel_case
    split('_').map{|e| e.capitalize}.join
  end
end

