require "terminal-table"

module Formatable
  module ClassMethods
    def objectify(keys, all_values)
      all_values.collect do |values|
        keys.zip(values).to_h
      end
    end

    def tablefy(content)
      headers = content.first.keys.collect do |key|
        key.to_s.colorize(:green)
      end
      rows = content.collect do |row|
        row.values
      end
      Terminal::Table.new :headings => headers, :rows => rows
    end
  end
end
