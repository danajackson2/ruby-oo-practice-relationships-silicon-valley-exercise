class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth  
        @@all << self
    end

    def self.all
        @@all  
    end

    def self.tres_commas_club
        self.all.select{|vc| vc.total_worth > 1000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select{|fr| fr.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.map{|fr| fr.startup}.uniq
    end

    def biggest_investment
        self.funding_rounds.max_by{|fr| fr.investment}
    end

    # A little unclear if it wanted total invested in that domain, or total in that domain by this vc. I assume the latter.
    # I think there is a cleaner way to do this without the tot = 0, hmm...

    def invested(domain)
        tot = 0
        self.funding_rounds.select{|fr| fr.startup.domain == domain}.each{|fr| tot += fr.investment}
        tot
    end
end
