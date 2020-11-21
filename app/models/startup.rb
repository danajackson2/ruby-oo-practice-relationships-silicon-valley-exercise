class Startup
    attr_accessor :name, :domain
    attr_reader :founder 

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(name, domain)
        @name = name
        @domain = domain
    end

    def self.find_by_founder(founder)
        self.all.find{|startup| startup.founder == founder}
    end

    def self.all
        @@all  
    end

    def self.domains
        self.all.map{|startup| startup.domain}
    end

    def sign_contract(vc, type, investment)
        FundingRound.new(self, vc, type, investment)
    end

    def funding_rounds
        FundingRound.all.select{|fr| fr.startup == self}
    end
       
    def num_funding_rounds
        self.funding_rounds.count
    end

    def total_funds
        self.funding_rounds.sum{|fr| fr.investment}
    end

    def investors
        self.funding_rounds.map{|fr| fr.venture_capitalist}.uniq
    end
end
