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
    @hash = Hash.new
    @text.each do |word|
      @hash["#{word}"] = @text.count(word)
    end
  end

  def frequencies
    @hash
  end

  def frequency(word)
    if @hash[word] == nil
      0
    else
      @hash[word]
    end
  end

  def top_words(number)
   frequencies.sort { |a, b| [b[1], a[0]] <=> [a[1], b[0]] }[0..(number - 1)]
  end

  def print_report
    top_words(10).each do |w, n|
      puts "#{w} |".rjust(9) + " #{n} ".ljust(4) + "*" * @text.count(w)
    end
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
