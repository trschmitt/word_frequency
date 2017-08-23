class Wordfreq
  STOP_WORDS = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from',
    'has', 'he', 'i', 'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to',
    'were', 'will', 'with']

  def initialize(filename)
    @text = File.read(filename)
      .gsub(/\W/, ' ')
      .downcase
      .split(" ")
      .reject{|e| STOP_WORDS.include? e}
    # @text.each_line do |line|
    #   words = line.split
    #   words.each do |word|
    #     if words_hash.has_key?(word)
    #       words_hash[word] = words_hash[word] + 1
    #     else
    #       words_hash[word] = 1
    #     end
    #   end
    # end
  end

  def frequency(word)

  end

  def frequencies

  end

  def top_words(number)

  end

  def print_report

  end
end

if __FILE__ == $0
  filename = ARGV[0]
  if filename
    full_filename = File.absolute_path(filename)
    if File.exists?(full_filename)
      wf = Wordfreq.new(full_filename)
      wf.print_report
    else
      puts "#{filename} does not exist!"
    end
  else
    puts "Please give a filename as an argument."
  end
end
