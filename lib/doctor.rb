class Doctor
  attr_reader(:name, :specialty)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
    @id = attributes.fetch(:id)
  end

  define_method(:==) do |doctor_to_compare|
    name == doctor_to_compare.name && specialty == doctor_to_compare.specialty
  end

  define_singleton_method(:all) do
    doctors = []
    results = DB.exec("SELECT * FROM doctors;")
    results.each() do |doctor|
      name = doctor.fetch("name")
      specialty = doctor.fetch("specialty")
      id = doctor.fetch("id").to_i()
      doctors.push(Doctor.new({:name => name, :specialty => specialty, :id => id}))
    end
    doctors
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end
end
