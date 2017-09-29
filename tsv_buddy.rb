# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  
  def take_tsv(tsv)
  	@data = []
  	rows = tsv.split("\n") 
  	header = rows.first.strip.split("\t")
  	rows[1..-1].each{ |line| @data << header.zip(line.strip.split("\t")).to_h }
  	@data
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
  	contents = ""
  	header_Array = []
  	@data[0].each_key{ |header| header_Array << header }
  	contents << header_Array.join("\t") + "\n"

    @data.each{ |data_Hash|
    	data_Array  = []
    	data_Hash.each_value{ |value| data_Array << value }

    	contents << data_Array.join("\t") + "\n"
  	}

	contents
  end
end
