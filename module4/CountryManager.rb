=begin
A CLI application for handling data from as many countries as we can.

Example of what data we can have:
Population
GDP(Gross Domestic Production)
States
Army Strength
State of the country(developing, developed) Etc.

On the basis of all these data we will be building modules to conceive various outputs like:
Whether that country will get a loan from the IMF (International Monetary Fund) or WB (World bank).
Whether the country can have a seat in the UN (United Nations) Security Council.
Whether the country can win the war or not  
=end

module CountryCriteria
  def eligible_for_loan(state_of_country)
    if state_of_country.upcase == 'DEVELOPING' || state_of_country.upcase == 'UNDERDEVELOPED'
      puts 'Eligible to get loan from IMF or World Bank'
    else
      puts 'Not eligible to get loan from IMF or World Bank'
    end
  end

  def seat_in_uns(gdp, army_strength)
    if gdp >= 8 && army_strength >= 100
      puts 'Eligible to get seat in UNS'
    else
      puts 'NOT Eligible to get seat in UNS'
    end
  end
end

module CountryStrength
  def win(army_strength)
    if army_strength >= 80
      puts "You are going to definitly win!!!"
    else
      puts 'Need to increaase army strength'
    end
  end
end

class Country
  include CountryCriteria
  prepend CountryStrength
  attr_accessor :population, :gdp, :states, :army_strength, :state_of_country
  def initialize(population, gdp, states, army_strength, state_of_country)
    @population = population
    @gdp = gdp
    @states = states
    @army_strength = army_strength
    @state_of_country = state_of_country
  end
end

def is_country_present?(country)
  if country != nil
    return true
  else
    puts 'First enter the country data'
    return false
  end
end

is_country = false
while true
  puts 'Enter choice: '
  puts '1.Enter country data '
  puts '2.Is country eligible to get loan from World Bank or IMF?'
  puts '3.Is country able to secure place in UNS?'
  puts '4.Is country able to win from enemy?'
  puts 'Enter 0 to exit'
    case gets.chomp.to_i
    when 1
      puts 'Enter population, GDP, number of states, army strength(200-1), state of country'
      country = Country.new(gets.chomp.to_i, gets.chomp.to_f, gets.chomp.to_i, gets.chomp.to_i, gets.chomp)
      is_country = true
    when 2
      country.eligible_for_loan(country.state_of_country) if is_country_present?(country)
    when 3
      country.seat_in_uns(country.gdp, country.army_strength) if is_country_present?(country)
    when 4
      country.win(country.army_strength) if is_country_present?(country)
    when 0
      break
    else
      puts "invalid choice"
  end
end
