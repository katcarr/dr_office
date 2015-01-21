class Patient
  attr_reader(:name, :birthdate)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @birthdate = attributes.fetch(:birthdate)
    @id = attributes.fetch(:id)
  end

  define_method(:==) do |patient_to_compare|
    name == patient_to_compare.name && birthdate == patient_to_compare.birthdate
  end

  define_singleton_method(:all) do
    patients = []
    results = DB.exec("SELECT * FROM patients;")
    results.each() do |patient|
      name = patient.fetch("name")
      birthdate = patient.fetch("birthdate")
      id = patient.fetch("id").to_i()
      patients.push(Patient.new({:name => name, :birthdate => birthdate, :id => id}))
    end
    patients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO patients (name, birthdate) VALUES ('#{@name}', '#{@birthdate}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end
end
