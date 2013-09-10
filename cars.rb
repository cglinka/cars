class Car

	attr_accessor :convertible

	@@total_car_count = 0
	@@cars_per_color={}
	@@rating_arr=[]

	# Class method for tracking the total number of cars created.
	def self.total_car_count
		@@total_car_count
	end

	def self.cars_per_color
		@@cars_per_color
	end

	def self.rating_arr
		@@rating_arr
	end

	def self.most_popular_color
    arr_popular_colors = Car.cars_per_color.sort_by { |key, value| value }

    puts "The most popular color is #{arr_popular_colors[-1][0]} with #{arr_popular_colors[-1][1]} car(s)."
	  return arr_popular_colors[-1][0]
	end

	def self.most_popular_color_working_yay
		highest_value = 0
		popular = nil
		Car.cars_per_color.each_pair do |key, value|
			if value > highest_value
				highest_value = value
				popular = key
			end
		end
		return popular	
	end

	def self.average_car_rating
		denominator = @@rating_arr.count
		total = 0
	  @@rating_arr.each do |rating|
	    total = total + rating
	  end
    return total/denominator
	end

	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	def initialize(color, rating)
		@fuel = 10
		@distance = 0
		@color=color
		@@total_car_count += 1
		update_hash(color)
		@rating=rating
		@@rating_arr << rating
	end

	def update_color(new_color)
		old_color = @color
    @color = new_color

    update_hash(new_color)

    old_color = old_color.to_sym
    
    @@cars_per_color[old_color] -=1
  end
    

	def update_hash(color)
		key_color = color.to_sym
		if (@@cars_per_color.has_key?(key_color))
		  @@cars_per_color[key_color] +=1
		else 
			@@cars_per_color.merge!(key_color => 1)
		end
	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end
end

class Truck < Car
	def initialize
		@load_status='unloaded'
	end

	def load
	  @load_status = 'loaded'
	end

	def unload
	  @load_status = 'unloaded'
	end
end

class Suv < Car

	def initialize
		@roof_box = false
	end
	
  def roof_box_on
  	@roof_box = true
  end

  def roof_box_off
  	@roof_box = false	
  end
end


class Convertible < Car
	def top_down
  	@roof_status = 'top down'
  	return "top down"
  end
  
  def close_top
  	@roof_status = 'closed top'
  	puts "top up"
  end
end 

car_a = Convertible.new("blue", 5)
car_b = Convertible.new("blue", 4)
car_c = Car.new("red", 5)
car_d = Car.new("red", 1)
car_e = Car.new("red", 3)
car_f = Car.new("green", 2)
puts car_a
puts car_b
car_a.drive(10)
puts car_a
puts car_b
car_a.drive(232)
car_b.drive(117)
puts car_a
puts car_b

puts car_a.top_down

# puts Car.total_car_count
# c1 = Car.new("white")
# puts Car.total_car_count
# c2 = Car.new("black")
# puts Car.total_car_count

# c = Car.new("orange")
# c.drive(10)

# puts Car.cars_per_color

# # c.update_color("purple")

# puts Car.cars_per_color

# puts Car.most_popular_color_working_yay

# Car.most_popular_color
# puts Car.most_popular_color


# puts Car.rating_arr.count

# puts Car.average_car_rating