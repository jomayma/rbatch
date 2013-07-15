class Splitter
  
  def initialize(filename, lines_by_part = 1)
    @filename = filename
    @lines_by_part = lines_by_part
  end
  
  def split(filename_sufix = nil)
  
    begin
      myfile = File.open(@filename, 'r')
      part = 0
      result = []
      next_line = myfile.readline
      result[part] = next_line
      lines_read = 1
      while !myfile.eof
        while lines_read < @lines_by_part
          next_line = myfile.readline
          result[part] = result[part] + next_line
          lines_read += 1
        end
        part += 1
        next_line = myfile.readline
        result[part] = next_line
        lines_read = 1
      end
    #: end of file reached>
    rescue EOFError => e
      #$stdout.print "end of file reached: " + e
      #$stderr.print "end of file reached: " + $!
      #debugger
      myfile.close
    end
    
    if filename_sufix
    #debugger
      #filename_without_extension = @filename.split(/\.\w+$/)[0]
      #filename_extension = @filename.split(/\.\w+$/)[1]
      i = 0
      result.each do |part|
        f = File.new(@filename+"."+filename_sufix+i.to_s,"w+")
        f.write(part)
        f.close
        i += 1
      end
    else
      return result
    end
  end
  
  protected # prevents method from being invoked by external callers
  
  def split_text( text )
    result =text.split(/[\n,\r]/)
  end
  
end
