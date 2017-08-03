class Character < ActiveRecord::Base
  has_many :appearances
  has_many :episodes, through: :appearances
  has_many :lines, through: :appearances
  has_many :locations, through: :lines

  scope :appearable, -> {joins("INNER JOIN appearances ON characters.id = appearances.character_id")}
  scope :talkable, -> {joins("INNER JOIN lines ON appearances.id = lines.appearance_id")}
  scope :coutable_desc, -> {order("count(*) DESC")}

  extend Importable::ClassMethods, Formatable::ClassMethods, Findable::ClassMethods

  def self.characters_most_appearances
    characters = Character.appearable.group("appearances.character_id").order("total DESC")
                   .limit(10).pluck(:id, :name, "count(appearances.id) AS total")
    keys = [:id, :name, :total]

    self.build_result(characters, keys)
  end

  def self.characters_most_talkative
    characters = Character.appearable.talkable.group("appearances.character_id").order("total DESC").limit(10)
                   .pluck(:id, :name, "count(lines.id) AS total")
    keys = [:id, :name, :total]

    self.build_result(characters, keys)
  end

  def self.characters_list_x_amount(x = 10)
    characters = Character.limit(x.to_i).pluck(:id, :name)
    keys = [:id, :name]

    self.build_result(characters, keys)
  end
end
