require 'open-uri'

Shirt.delete_all
open("http://ubuntuone.com/0IVLOlPGx1aENC0EpYD38x", "r:ISO-8859-1") do |shirt|
  i = 0
  e = 0
	shirt.read.each_line do |shirt|
    i += 1
    puts ""
    puts i
    puts shirt
		hemdenpilot_id, label, description, ean, size_collar, size_bust, size_waist, size_body, size_arm, size_shoulder, size_back, size_wrist, sleeve, profile, collar, breast_pocket, wristband, color, cloth, price, valid_since, affiliate, link = shirt.chomp.split("|")
		code = (0...8).map { (65 + rand(26)).chr }.join
    nothing = affiliate.nil? && link.nil?
    unless nothing
      begin
        Shirt.create!(:label => label, :description => description, :ean => ean, :size_collar => size_collar, :size_bust => size_bust, :size_waist => size_waist, :size_body => size_body, :size_arm => size_arm, :size_shoulder => size_shoulder, :size_back => size_back, :size_wrist => size_wrist, :sleeve => sleeve, :profile => profile, :collar => collar, :breast_pocket => breast_pocket, :wristband => wristband, :color => color, :cloth => cloth, :price => price, :code => code, :affiliate =>  affiliate, :link => link)
        puts code
        puts label
        puts 'created ' + code + ' ' + label + ' ' + size_collar
      rescue
        e += 1
        puts "ERROR nr #{e}. Proceeding with next Shirt"
      end
    end
  end
  puts "I could not create #{e} shirts"
end
