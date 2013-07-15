class Splitter
  
  def initialize(filename, lines_by_part = 1)
    @filename = filename
    @lines_by_part = lines_by_part
  end
  
  def split(filename_sufix = nil)
    part, lines_read = -1, 1
    result = []
    IO.foreach(@filename) {|next_line|
      if ( @lines_by_part == 1 or (lines_read%@lines_by_part == 1) )
        part += 1
        result[part] = next_line
      else
        result[part] += next_line
      end
      lines_read += 1
    }
    
    if filename_sufix
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
