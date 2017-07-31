require "csv"

module Importable
  module ClassMethods
    def fields
      self.columns.map {|i| i.name.to_sym}
    end

    def import(file)
      puts file.inspect
      CSV.foreach(file, :headers=>:true, header_converters: :symbol) do |row|
        object = parse(row)
        object.save
      end
    end

    def parse(line)
      self.new(line.to_h)
    end
  end
end
