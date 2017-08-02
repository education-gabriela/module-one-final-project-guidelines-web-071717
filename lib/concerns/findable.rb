module Findable
  module ClassMethods
    def name_search(param)
      class_values = self.where("normalized_name like :name", name: "%#{param.downcase}%").pluck(:id, :name)
      keys = [:id, :name]
      self.objectify(keys, class_values)
    end
  end
end
