require 'spec_helper'

describe("Patient") do
  describe("#name") do
    it("returns the name of the patient") do
      test_dr = Patient.new({:name => "Kathryn", :birthdate => "2000-10-10", :id => nil})
      expect(test_dr.name()).to(eq("Kathryn"))
    end
  end

  describe("#birthdate") do
    it("returns the birthdate of the patient") do
      test_dr = Patient.new({:name => "Kathryn", :birthdate => "2000-10-10", :id => nil})
      expect(test_dr.birthdate()).to(eq("2000-10-10"))
    end
  end

  describe("#save") do
    it("saves itself to the patient table in the patients_office database") do
      test_dr = Patient.new({:name => "Kathryn", :birthdate => "2000-10-10", :id => nil})
      test_dr.save()
      expect(Patient.all()).to(eq([test_dr]))
    end
  end

  describe("#==") do
    it("will return true if name and birthdate are same") do
      test_dr = Patient.new({:name => "Kathryn", :birthdate => "2000-10-10", :id => nil})
      test_dr2 = Patient.new({:name => "Kathryn", :birthdate => "2000-10-10",:id => nil})
      expect(test_dr.==(test_dr2)).to(eq(true))
    end
  end

  describe(".all") do
    it("will return all patients in the Patient class inside an array") do
      test_dr = Patient.new({:name => "Kathryn", :birthdate => "2000-10-10", :id => nil})
      test_dr.save
      test_dr2 = Patient.new({:name => "Hazel", :birthdate => "2010-10-10", :id => nil})
      test_dr2.save
      expect(Patient.all()).to(eq([test_dr,test_dr2]))
    end
  end

end
