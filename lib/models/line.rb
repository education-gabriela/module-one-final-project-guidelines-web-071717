class Line < ActiveRecord::Base
  belongs_to :appearance
  belongs_to :location
  # belongs_to :episode, through: :episodes_characters_location
  # belongs_to :character, through: :episodes_characters_location
  # belongs_to :location, through: :episodes_characters_location

  extend Importable::ClassMethods, Formatable::ClassMethods

  def self.import(file)
    File.foreach(file) do |line|
      line.encode!("UTF-8", :invalid => :replace, :undef => :replace, :replace => "?")

      begin
        csv = CSV.parse(line, col_sep: "\t").first
        row = self.parse(csv)
        object = self.new(row)
        object.save
      rescue StandardError => e
        puts "Error when parsing #{line.inspect}"
      end
    end
  end

  def self.parse(line)
    {
      :id => line[0],
      :number => line[2],
      :timestamp_in_ms => line[4],
      :character_id => line[6],
      :episode_id => line[1],
      :location_id => line[7],
      :character_line => line[10],
      :character_normalized_line => line[11],
      :word_count => line[12]
    }
  end

  #---------QUERIES--------

  def self.find_by_segment(segment)
    segment = "%#{segment}%"
    lines = Line.where("character_normalized_line LIKE ?", segment).limit(50)
    # lines is an array of line objects
    
    self.print_lines(lines)

    puts "\n"
    # "You can use the green id value with the find_by_id command to get more information on a particular line."

  end

  def self.find_by_id(id)
    lines = Line.where("id = ?", id)
    self.print_lines(lines)
    puts "\nYou can use the episode_id with the episodes find_by_id method to find more info on the episode this line is from."
  end

  def self.random
    lines = Line.where("character_line IS NOT NULL").order("random()").limit(1)
    self.print_lines(lines)
    puts "\n"
  end

  def self.print_lines(lines)
    lines.each do |line|
      puts "\n"
      puts "id: " + line.id.to_s.colorize(:green)
      puts "episode_id: " + line.episode_id.to_s.colorize(:cyan)
      puts "character_line: " + line.character_line.to_s.colorize(:light_yellow)
    end
  end

end
