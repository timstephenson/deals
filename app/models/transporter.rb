class Transporter
  
  # This is a naive implementation. Given the task at hand it should suffice. 
  # In a fuller implementation I would first look to normalize the data before implementation
  # Ideally a comma or tab delimited file would be available. I suspect that if a tab or comma dilimitted
  # file could not be created, that the text file could not be normalized enough to make a reusable
  # class worth while. Customization would be required for every file format.
  
  # Because I am dealing with a small data, relatively clean data set in the export.txt file,
  # I am not making any effort to clean the data -- in a larger file there might be non UTF8 characters for example.
  # Also, I am not handling errors that may occur, or any unexpected values in the row, or poorly formatted dates.
  
  attr_accessor :file, :data, :new_deal, :new_advertiser
  def initialize(file_name)
    @file = File.open("#{Rails.root}/script/data/#{file_name}")
  end
  
  def transport_to_publisher(publisher)
    @file.each_with_index do |line, index|
      if index > 0
        parse_line(line)       
        advertiser = publisher.advertisers.create(@new_advertiser)
        advertiser = Advertiser.find_by_name(@new_advertiser[:name]) unless advertiser.valid?
        deal = advertiser.deals.create(@new_deal)
      end
    end 
  end
    
  private
  
  def parse_line(line)
    @data = line
    @new_deal = {description: nil, value: nil, price: nil, start_at: nil, end_at: nil}
    get_dates
    get_advertiser
    get_deal_and_value
  end
  
  def get_dates
    dates = @data.scan(naive_date_reg)
    start_date = dates.fetch(0, nil)
    end_date = dates.fetch(1, nil)
    format = '%m/%d/%Y'
    @new_deal[:start_at] = Date.strptime start_date, format unless start_date.blank?
    if end_date.blank?
      @new_deal[:end_at] = @new_deal[:start_at] + 1.day
    else
      @new_deal[:end_at] = Date.strptime end_date, format
    end
  end
  
  def get_advertiser
    @data = @data.split(naive_date_reg).collect{ |w| w.strip() }.delete_if { |w| w.blank? }
    @new_advertiser = {name: @data.shift}
  end
  
  def get_deal_and_value
    data = @data.pop.split(" ")
    @new_deal[:value] = data.pop
    @new_deal[:price] = data.pop
    @new_deal[:description] = data.join(" ")
  end
  
  def naive_date_reg
    /\d*\/\d*\/\d*/
  end
  
  

end