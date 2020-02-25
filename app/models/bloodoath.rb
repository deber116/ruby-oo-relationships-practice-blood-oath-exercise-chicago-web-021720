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

    #initiation date is saved as a TIme class. This is based on an integer of seconds
    #since 01/01/1970, so using min_by will give you the instance associated with
    #the lowest integer (earliest initiation date/time)
    def self.first_oath
        result = self.all.min_by {|bo| bo.initiation_date}
        result.follower
    end
end