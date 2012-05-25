class Transporter
  
  # This is a naive implementation. Given the task at hand it should suffice. 
  # In a fuller implementation I would first look to normalize the data before implementation
  # Ideally a comma or tab delimited file would be available. I suspect that if a tab or comma dilimitted
  # file could not be created, that the text file could not be normalized enough to make a reusable
  # class worth while. Customization would be required for every file format.
  
  # Because I am dealing with a small data, relatively clean data set in the export.txt file,
  # I am not making any effort to clean the data -- in a larger file there might be non UTF8 characters for example.
  # Also, I am not handling errors that may occur, or any unexpected values in the row, or poorly formatted dates.
  def initialize(file_name)
    @file = File.open("#{Rails.root}/script/data/#{file_name}")
  end
  
  def transport_to_publisher(publisher)
    @file.each_with_index do |line, index|
      if index > 0
        @data = line
        get_dates
        get_advertiser
        get_deal_and_value        
        advertiser = publisher.advertisers.create(name: @advertiser)
        advertiser = Advertiser.find_by_name(@advertiser) unless advertiser.valid?
        deal = advertiser.deals.create(description: @deal, value: @value, price: @price, start_at: @start_date, end_at: @end_date)
      end
    end 
  end
    
  private
  
  def get_dates
    dates = @data.scan(naive_date_reg)
    start_date = dates.fetch(0, nil)
    end_date = dates.fetch(1, nil)
    format = '%m/%d/%Y'
    @start_date = Date.strptime start_date, format unless start_date.blank?
    @end_date = Date.strptime end_date, format unless end_date.blank?
  end
  
  def get_advertiser
    @data = @data.split(naive_date_reg).collect{ |w| w.strip() }.delete_if { |w| w.blank? }
    @advertiser = @data.shift
  end
  
  def get_deal_and_value
    data = @data.pop.split(" ")
    @value = data.pop
    @price = data.pop
    @deal = data.join(" ")
  end
  
  def naive_date_reg
    /\d*\/\d*\/\d*/
  end
  
  

end