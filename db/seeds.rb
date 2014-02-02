require 'open-uri'

Shirt.delete_all
open("https://dl.dropboxusercontent.com/u/15177788/datenbank.csv") do |shirt|
	shirt.read.each_line do |shirt|
		label, description, ean, size_collar, size_bust, size_waist, size_body, size_arm, size_shoulder, size_back, size_wrist, sleeve, profile, collar, breast_pocket, wristband, color, cloth, price = shirt.chomp.split(",")
		code = (0...8).map { (65 + rand(26)).chr }.join
		Shirt.create!(:label => label, :description => description, :ean => ean, :size_collar => size_collar, :size_bust => size_bust, :size_waist => size_waist, :size_body => size_body, :size_arm => size_arm, :size_shoulder => size_shoulder, :size_back => size_back, :size_wrist => size_wrist, :sleeve => sleeve, :profile => profile, :collar => collar, :breast_pocket => breast_pocket, :wristband => wristband, :color => color, :cloth => cloth, :price => price, :code => code)
		puts 'created ' + code + ' ' + label + ' ' + size_collar
  end
end
