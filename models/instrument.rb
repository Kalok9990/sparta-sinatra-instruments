class Instrument
  attr_accessor :id, :name, :info, :image

  def save
    conn = Instrument.open_connection
    if(self.id)
      sql = "UPDATE instrument SET name='#{self.name}', info='#{self.info}', image='#{self.image}' WHERE id =#{self.id}"
    else
      sql = "INSERT INTO instrument (name, info, image) VALUES ('#{self.name}','#{self.info}','#{self.image}')"
    end
    conn.exec(sql)
  end

  def self.open_connection
    conn = PG.connect(dbname: "blog")
  end

  def self.all
    conn  = self.open_connection
    sql = "SELECT id, name, info, image FROM instrument ORDER BY id DESC"
    results = conn .exec(sql)
    instruments = results.map do |instrument|
      self.hydrate(instrument)
    end
  end

  def self.find(id)
    conn  = self.open_connection
    sql = "SELECT * FROM instrument WHERE id =#{id} LIMIT 1"
    instruments = conn.exec(sql)
    instrument = self.hydrate(instruments[0])
    instrument
  end

  def self.remove(id)
    conn = self.open_connection
    sql = "DELETE FROM instrument WHERE id = #{id}"
    conn.exec(sql)
  end

  def self.hydrate(instrument_data)
    instrument = Instrument.new
    instrument.id = instrument_data["id"]
    instrument.name = instrument_data["name"]
    instrument.info = instrument_data["info"]
    instrument.image = instrument_data["image"]
    instrument
  end
end
