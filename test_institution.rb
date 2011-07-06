require './institution.rb'
require 'minitest/autorun'

describe Institution do
  before do
    @institution = Institution.new
    @line = "655060042O0510000331070605123456789SOCIAL SECURITY ADMINISTRATION      6401 SECURITY BOULEVARD             BALTIMORE           MD212350000559555123411     "
    @institution.populate_from_line(@line)
  end
  
  describe "when given a line from the ACH file" do
    it "should have a routing number" do
      @institution.routing_number.must_equal "655060042"
    end
    it "should have an office code" do
      @institution.office_code.must_equal "O" # O for office.
    end
    it "should have a servicing frb" do
      @institution.servicing_frb.must_equal "051000033"
    end
    it "should have a record type code" do
      @institution.record_type_code.must_equal "1"
    end
    it "should have a change date" do
      @institution.change_date.must_equal Date.parse('2005/07/06')
    end
    it "should have a new routing number" do
      @institution.new_routing_number.must_equal "123456789"
    end
    it "should have a customer name" do
      @institution.customer_name.must_equal "SOCIAL SECURITY ADMINISTRATION"
    end
    it "should have an address" do
      @institution.address.must_equal "6401 SECURITY BOULEVARD"
    end
    it "should have a city" do
      @institution.city.must_equal "BALTIMORE"
    end
    it "should have a state code" do
      @institution.state_code.must_equal "MD"
    end
    it "should have a zipcode" do
      @institution.zipcode.must_equal "21235"
    end
    it "should have a zipcode extension" do
      @institution.zipcode_extension.must_equal "0000"
    end
    it "should have a telephone area code" do
      @institution.telephone_area_code.must_equal "559"
    end
    it "should have a telephone prefix number" do
      @institution.telephone_prefix_number.must_equal "555"
    end
    it "should have a telphone suffix number" do
      @institution.telephone_suffix_number.must_equal "1234"
    end
    it "should have an institution status code" do
      @institution.institution_status_code.must_equal "1"
    end
    it "should have a data view code" do
      @institution.data_view_code.must_equal "1"
    end
    it "should have a filler" do
      @institution.filler.must_equal "     "
    end
  end
  
end
