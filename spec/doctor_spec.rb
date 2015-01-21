require 'spec_helper'

describe("Doctor") do
  describe("#name") do
    it("returns the name of the doctor") do
      test_dr = Doctor.new({:name => "Dr. Brown", :specialty => "skin", :id => nil})
      expect(test_dr.name()).to(eq("Dr. Brown"))
    end
  end

  describe("#specialty") do
    it("returns the specialty of the doctor") do
      test_dr = Doctor.new({:name => "Dr. Brown", :specialty => "skin", :id => nil})
      expect(test_dr.specialty()).to(eq("skin"))
    end
  end

  describe("#save") do
    it("saves itself to the doctor table in the doctors_office database") do
      test_dr = Doctor.new({:name => "Dr. Brown", :specialty => "skin", :id => nil})
      test_dr.save()
      expect(Doctor.all()).to(eq([test_dr]))
    end
  end

  describe("#==") do
    it("will return true if name and specialty are same") do
      test_dr = Doctor.new({:name => "Dr. Brown", :specialty => "skin", :id => nil})
      test_dr2 = Doctor.new({:name => "Dr. Brown", :specialty => "skin" , :id => nil})
      expect(test_dr.==(test_dr2)).to(eq(true))
    end
  end

  describe(".all") do
    it("will return all doctors in the Doctor class inside an array") do
      test_dr = Doctor.new({:name => "Dr. Brown", :specialty => "skin", :id => nil})
      test_dr.save
      test_dr2 = Doctor.new({:name => "Dr. Pink", :specialty => "feet", :id => nil})
      test_dr2.save
      expect(Doctor.all()).to(eq([test_dr,test_dr2]))
    end
  end

  describe("#list_patients") do
    it("will add a patient to a doctor") do
      test_dr = Doctor.new({:name => "Dr. Brown", :specialty => "skin", :id => nil})
      test_dr.save
      test_patient = Patient.new({:name => "Hazel", :birthdate => "2010-10-10", :id => nil})
      test_patient.save
      test_patient2 = Patient.new({:name => "Ash", :birthdate => "2010-10-10", :id => nil})
      test_patient2.save
      test_dr.add_patient(test_patient.id)
      expect(test_dr.list_patients).to(eq([test_patient, test_patient2]))
    end
  end

  describe("#add_patient") do
    it("will add a patient to a doctor") do
      test_dr = Doctor.new({:name => "Dr. Brown", :specialty => "skin", :id => nil})
      test_dr.save
      test_patient = Patient.new({:name => "Hazel", :birthdate => "2010-10-10", :id => nil})
      test_patient.save
      test_dr.add_patient(test_patient)
      expect(test_dr.list_patients).to(eq([test_patient]))
    end
  end
end
