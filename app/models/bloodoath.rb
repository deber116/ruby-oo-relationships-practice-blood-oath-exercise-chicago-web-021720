class BloodOath
    attr_reader :follower, :cult

    @@all = []
    
    def initialize(follower, cult, initiation_date = Time.now)
        @follower = follower
        @cult = cult
        @initiation_date = initiation_date
        @@all << self
    end

    def self.all
        @@all
    end

    def initiation_date
        @initiation_date.strftime("%F")
    end

    def self.first_oath
        result = self.all.min_by {|bo| bo.initiation_date}
        result.follower
    end
end