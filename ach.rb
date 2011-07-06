require 'rubygems'
require 'bundler'
require 'open-uri'
require 'benchmark'

Bundler.require

require "./institution.rb"

def prepare_database
  DataMapper.setup(:default, "sqlite:///#{Dir.pwd}/db/ach.db")
  DataMapper.finalize
  DataMapper.auto_migrate!
  Institution.all.destroy
end

def create_institution_from_line(line)
  institution = Institution.new
  institution.populate_from_line(line)
  if ! institution.save
    institution.errors.each do |e|
      puts e
    end
  end
end

FED_ACH_URL = "#{Dir.pwd}/FedACHdir.txt"
#"http://www.fededirectory.frb.org/FedACHdir.txt"
def process_feed
  # wrap in a transaction to improve performance.
  Institution.transaction do
    open(FED_ACH_URL) do |f|
      f.each do |line|
        create_institution_from_line(line)
      end
    end
  end
end

prepare_database
time = Benchmark.realtime do
  process_feed
end

puts "Finished in #{time} seconds"
