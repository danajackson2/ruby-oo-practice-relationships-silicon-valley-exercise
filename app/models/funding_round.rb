class FundingRound
    attr_reader :startup, :venture_capitalist, :type, :investment

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        # Can I do this here? Seems to work.
        @investment = investment.to_f if investment > 0 
        @@all << self
    end

    def self.all
        @@all  
    end
end
