require('pg')
require('pry-byebug')
class Property

  attr_accessor :address, :price, :number_of_bedrooms, :year_of_build, :buy_let, :square_footage, :build_type
  attr_reader :id

  def initialize ( options )
    @address = options['address']
    @price = options['price'].to_i
    @number_of_bedrooms = options['number_of_bedrooms'].to_i
    @year_of_build = options['year_of_build'].to_i
    @buy_let = options['buy_let']
    @square_footage = options['square_footage'].to_i
    @build_type = options['build_type']
    @id = options['id'].to_i if options['id']
  end

  def save()
    db = PG.connect({ dbname: 'properties', host: 'localhost' })
    sql = "INSERT INTO properties
    (address,
      price,
      number_of_bedrooms,
      year_of_build,
      buy_let,
      square_footage,
      build_type)
      VALUES
      ($1, $2, $3, $4, $5, $6, $7)
      RETURNING id"
      values = [@address, @price, @number_of_bedrooms, @year_of_build, @buy_let, @square_footage, @build_type]
      db.prepare("save", sql )
      @id = db.exec_prepared("save", values)[0]["id"].to_i
      db.close()
  end

  def Property.all()
    db = PG.connect({ dbname: 'properties', host: 'localhost' })
    sql = "SELECT * FROM properties;"
    db.prepare("all", sql)
    property_hashes = db.exec_prepared("all")
    db.close()
    return property_hashes.map { |property_hash| Property.new(property_hash) }
  end

  def update()
    db = PG.connect({ dbname: 'properties', host: 'localhost'})
    sql = "UPDATE properties
    SET
    (address,
      price,
      number_of_bedrooms,
      year_of_build,
      buy_let,
      square_footage,
      build_type
    ) =
    ($1, $2, $3, $4, $5, $6, $7
    )
    WHERE id = $8"
    values = [@address, @price, @number_of_bedrooms, @year_of_build, @buy_let, @square_footage, @build_type, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close
  end

end
