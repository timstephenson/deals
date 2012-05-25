namespace :import do
  desc "Import deals for a publisher"
  task :transport_to, [:publisher, :file_name] => :environment do |t, args|
    
    args.with_defaults(:publisher => 'The Daily Planet', :file_name => "daily_planet_export.txt")

    transporter = Transporter.new(args[:file_name])
    publisher = Publisher.find_or_create_by_name(args[:publisher])
    transporter.transport_to_publisher(publisher) 
    
  end
end