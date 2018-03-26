require_relative 'entry'
require "csv"

  class AddressBook
    attr_reader :entries
    
  def initialize
    @entries = []
  end
  
  def remove_entry(name, phone_number, email)
    delete_entry = nil
    
  @entries.each do |entry|
    if name == entry.name && phone_number == entry.phone_number && email == entry.email
      delete_entry = entry
    end
  end
  
  @entries.delete(delete_entry)
  end
  
  def add_entry(name, phone_number, email)
# #9
  index = 0
  entries.each do |entry| 
# #10
    if name < entry.name
      break
    end
    index+= 1
  end
# #11
  entries.insert(index, Entry.new(name, phone_number, email))
  end
# #7
  def import_from_csv(file_name)
    #Implementation goes here
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

# #8 iterate over the CSV::Table object's rows. Then convert each row_hash to an Entry
#    by using the add_entry method.  It also adds Entry to AddressBook entries
  csv.each do |row| 
    row_hash = row.to_hash
    add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end
  end
