class Follower
    attr_reader :name, :age, :life_motto

    @@all = []
    
    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def cults
        result = BloodOath.all.select {|bo| bo.follower == self}
        result.map {|bo| bo.cult}
    end

    #inputs an instance of cult
    def join_cult(cult)
        cult.recruit_follower(self)
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        self.all.select {|follower| follower.age >= age}
    end

    def my_cults_slogans
        self.cults.map {|cult| p cult.slogan}
    end

    def self.most_active
        self.all.max_by {|follower| follower.cults.count}
    end

    def self.top_ten
        top_ten = self.all.sort_by {|follower| follower.cults.count}
        top_ten.reverse!.first(10)
    end
end