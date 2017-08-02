module Findable
  module ClassMethods
    def name_search(**params)
      class_values = self.where("normalized_name like :name", name: "%#{params[:name].downcase}%").pluck(:id, :name)
      keys = [:id, :name]
      # binding.pry
      self.objectify(keys, class_values)
    end
  end
end
