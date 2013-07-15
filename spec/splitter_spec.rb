require 'spec_helper'

describe Splitter, "#split" do
  it "returns the same line for a Text with only one line" do
    splitter = Splitter.new("./spec/1_line_text.txt")

    split_result = splitter.split()
    split_result[0].should eq("Ciao bello!\n")
  end

  it "returns 2 lines for a Text with only 2 lines (by default 1 line per part)" do
    splitter = Splitter.new("./spec/two_lines_text.txt")

    split_result = splitter.split()
    split_result[0].should eq("Ciao bello!\n")
    split_result[1].should eq("come stai?\n")
  end
  
  it "split(4_lines_text, 2) returns 2 elements with 2 lines each" do
    splitter = Splitter.new("./spec/four_lines_text.txt", 2)
    
    split_result = splitter.split()
    split_result[0].should eq("Ciao\nbello!\n")
    split_result[1].should eq("come\nstai?\n")
  end
  
  it "split(n_lines_text, m) returns an array with (n/m+n%m) elements" do
    #n = total text lines
    #m = num lines to split the file
    #splitter = Splitter.initialize()
    splitter = Splitter.new("./spec/10_lines_text.txt", 3)
    #file = File.open("./spec/10_lines_text.txt", 'r')
    #ten_lines_text = file.read

    split_result = splitter.split()
    split_result.length.should eq(10/3+10%3)
  end
  
  it "Splitter.new(file_with_4_lines, 2).split('sufix') write split result into 2 files elements with 2 lines each" do
    splitter = Splitter.new("./spec/four_lines_text.txt", 2)
    
    split_result = splitter.split("part")
    
    file0 = File.open("./spec/four_lines_text.txt.part0", 'r')
    file0.read.should eq("Ciao\nbello!\n")
    file0.close
    file1 = File.open("./spec/four_lines_text.txt.part1", 'r')
    file1.read.should eq("come\nstai?\n")
    file1.close
  end
end
