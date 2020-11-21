require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

apple = Startup.new("Apple", "Steve Jobs", "computers")
ibm = Startup.new("IBM", "Charles Flint", "computers")
amazon = Startup.new("Amazon", "Jeff Bezos", "shopping")
flightcar = Startup.new("Flightcar", "Rujul Zaparde", "car rental")

bill = VentureCapitalist.new("Billy Budd", 9000000)
don = VentureCapitalist.new("Donny Wallace", 5000)
val = VentureCapitalist.new("Valerie Tubbs", 16000000)

f1 = FundingRound.new(apple, val, "Angel", 20)
f2 = FundingRound.new(amazon, val, "Series A", 9000)
f3 = FundingRound.new(apple, don, "Series C", 18000)
f4 = don.offer_contract(flightcar, "Series B", 800000)
f5 = amazon.sign_contract(bill, "Pre-Seed", 52884)
f6 = val.offer_contract(ibm, "Seed", 60500)

binding.pry
0