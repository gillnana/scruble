require 'rubygems'
#require 'andand'

f = File.open('/Users/jgill/work/side/scrabtcp/bytes.txt')
data = []
working_datum = []


timestamp = 0
old_time = 0

regex = /\d\d\d\d\s+(.*)/

f.readlines.each_with_index do |line,indx|
  if line.length < 2
    datum = working_datum.dup
    working_datum = []
    next unless datum[69]
    control = datum[66..68].join(" ")
    real_datum = datum[69..-1].map { |h| h.hex.chr }.join("")
    #puts datum[58..61].join
    timestamp = datum[58..61].join("").hex - old_time
    old_time = datum[58..61].join("").hex
    next unless real_datum.include? "ALIVE"
    data << control + " " + timestamp.to_s + (real_datum.length + 1).to_s + real_datum
    working_datum = []
    next
  end
  working_datum += line[6..52].split(/ /)
end

puts data