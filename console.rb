require('pry-byebug')
require_relative('models/property_class')

property1 = Property.new({'address' => '31 Castle Terrace', 'price' => '100000', 'number_of_bedrooms' => '5', 'year_of_build' => '2000', 'buy_let' => 'buy', 'square_footage' => '5000', 'build_type' => 'building'})

property2 = Property.new({'address' => '25 Castle Terrace', 'price' => '50000', 'number_of_bedrooms' => '3', 'year_of_build' => '2002', 'buy_let' => 'let', 'square_footage' => '4000', 'build_type' => 'flat'})

property3 = Property.new({'address' => '30 Castle Terrace', 'price' => '60000', 'number_of_bedrooms' => '4', 'year_of_build' => '1999', 'buy_let' => 'buy', 'square_footage' => '10000', 'build_type' => 'farm'})

# property1.save()
# property1.update({ 'buy_let' => 'let'})
property3.save
property3.price = '70000'
property3.update
property3.save
# property2.price = '33333'
# property2.update()
# property1.price = "22222"
# property1.update()
# property1.save()

# current_properties = Property.all()
# p current_properties.length
