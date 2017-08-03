module Findable
  module ClassMethods
    def name_search(param)
      class_values = self.where("normalized_name like :name", name: "%#{param.downcase}%").pluck(:id, :name)
      keys = [:id, :name]

      build_result(class_values, keys)
    end

    def build_result(result, keys)
      if result.empty?
        return "Not found".colorize(:red)
      end

      hash = self.objectify(keys, result)
      self.tablefy(hash)
    end
  end
end
