require_relative 'report_algorithm'

url = ARGV[0]
file = ARGV[1]

print "Script stated at "  + Time.now.inspect
ReportAlgorithm.new(url, file).build
print "Script ended "  + Time.now.inspect