require 'datamapper'

class Institution
  include DataMapper::Resource
  
  property :id,                       Serial
  property :routing_number,           String, :length => 9
  property :office_code,              String, :length => 1
  property :servicing_frb,            String, :length => 9
  property :record_type_code,         String, :length => 1
  property :change_date,              Date                  #MMDDYY
  property :new_routing_number,       String, :length => 9
  property :customer_name,            String, :length => 1..36
  property :address,                  String, :length => 1..36
  property :city,                     String, :length => 1..20
  property :state_code,               String, :length => 2
  property :zipcode,                  String, :length => 5
  property :zipcode_extension,        String, :length => 4
  property :telephone_area_code,      String, :length => 3
  property :telephone_prefix_number,  String, :length => 3
  property :telephone_suffix_number,  String, :length => 4
  property :institution_status_code,  String, :length => 1
  property :data_view_code,           String, :length => 1
  property :filler,                   String, :length => 5

  def populate_from_line(line)
    self.routing_number          = line[0..8]
    self.office_code             = line[9]
    self.servicing_frb           = line[10..18]
    self.record_type_code        = line[19]
    self.change_date             = Date.strptime(line[20..25], '%m%d%y')
    self.new_routing_number      = line[26..34]
    self.customer_name           = line[35..70].strip
    self.address                 = line[71..106].strip
    self.city                    = line[107..126].strip
    self.state_code              = line[127..128]
    self.zipcode                 = line[129..133]
    self.zipcode_extension       = line[134..137]
    self.telephone_area_code     = line[138..140]
    self.telephone_prefix_number = line[141..143]
    self.telephone_suffix_number = line[144..147]
    self.institution_status_code = line[148]
    self.data_view_code          = line[149]
    self.filler                  = line[150..154]
  end

end
