class Episode < ActiveRecord::Base
  has_many :appearances
  has_many :lines, through: :appearances
  has_many :characters, through: :appearances
  has_many :locations, through: :lines

  scope :no_zero_season, -> {where("season != 0")}
  scope :no_empty_air_date, -> {where("original_air_date IS NOT NULL")}

  extend Importable::ClassMethods, Formatable::ClassMethods, Findable::ClassMethods

  def self.valid_episodes
    Episode.no_zero_season.no_empty_air_date
  end

  def self.name_search(param)
    episodes = self.where("title like :name", name: "%#{param.downcase}%").pluck(:id, :title)
    keys = [:id, :title]

    self.build_result(episodes, keys)
  end

  def self.most_popular(limit = 10)
    episodes = Episode.valid_episodes.order(us_viewers_in_millions: :desc).limit(limit)
                 .pluck(:id, :title, :season, :number_in_season, :us_viewers_in_millions, :original_air_date)
    keys = [:id, :title, :season, :episode_number, :million_viewers, :air_date]

    self.build_result(episodes, keys)
  end

  def self.get_season_info(season_number = 28)
    episodes = Episode.valid_episodes.where(season: season_number.to_i)
                 .order(:number_in_season).pluck(:id, :title, :original_air_date, :number_in_season)
    keys = [:id, :title, :air_date, :number_in_season]

    self.build_result(episodes, keys)
  end

  def self.find_by_id(id)
    episodes = [self.valid_episodes.find(id)].pluck(:id, :title, :original_air_date, :season, :number_in_season)
    keys = [:id, :title, :air_date, :season, :number_in_season]

    self.build_result(episodes, keys)

  end
end
