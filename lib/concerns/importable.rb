require "csv"

module Importable
  module ClassMethods
    def fields
      self.columns.map {|i| i.name.to_sym}
    end

    def import(file)
      CSV.foreach(file, :headers=>:true, header_converters: :symbol) do |row|
        object = parse(row)
        object.save
      end
    end

    def parse(line)
      values = line.to_h.values_at(*self.fields)
      array = self.fields.map.with_index do |field, i|
        [field, values[i]]
      end

      self.new(array.to_h)
    end
  end
end
