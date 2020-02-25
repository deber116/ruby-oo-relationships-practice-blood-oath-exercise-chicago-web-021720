class Cult 
    attr_reader :name, :location, :founding_year, :slogan

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def self.all
        @@all
    end

    #Input is a cult name as String
    #Returns cult instance with matching name
    def self.find_by_name(cult_name)
        self.all.select {|cult| cult.name == cult_name}
    end

    def self.find_by_location(location)
        result = self.all.select {|cult| cult.location  == location}
    end

    def self.find_by_founding_year(founding_year)
        result = self.all.select {|cult| cult.founding_year  == founding_year}
    end

    def recruit_follower(follower)
        BloodOath.new(follower, self)
    end

    def cult_population
        self.followers.count
    end

    #Returns all follower instances in cult
    def followers
        result = BloodOath.all.select {|bo| bo.cult == self}
        result.map {|bo| bo.follower}
    end

    def average_age
        sum = self.followers.reduce(0.0) {|sum, follower| sum += follower.age}
        avg = sum / self.followers.count
    end

    def my_favorite_mottos
        self.followers.each {|f| p f.life_motto}
    end

    def self.least_popular
        low_cult = self.all.min_by {|cult| cult.cult_population}
        Cult.all.select {|cult| low_cult.cult_population == cult.cult_population}
    end

    def self.most_common_location
        locations = self.all.map {|cult| cult.location}
        locations.max_by {|location| locations.count(location)}
    end
end