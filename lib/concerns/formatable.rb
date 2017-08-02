module Formatable
  module ClassMethods
    def objectify(keys, all_values)
      all_values.collect do |values|
        keys.zip(values).to_h
      end
    end
  end
end
