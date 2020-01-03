class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:,name:,type:,db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name,type,database)
    database.execute("INSERT INTO pokemon (name,type) VALUES (?,?)", name, type)
  end
  
  def self.find(id,database)
    pokemon = database.execute("SELECT * FROM pokemon WHERE id = ?",id).flatten
    name = pokemon[1]
    type = pokemon[2]
    
    new_pokemon = Pokemon.new(id: id, name: name, type: type, db: database)
  end 
  
end
