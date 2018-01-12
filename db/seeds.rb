# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rubygems'
require 'nokogiri'
require 'open-uri'


def colors()

  doc = Nokogiri::HTML(open("http://www.eagle-web-designs.com/cool_stuff/ColorChart.html"))
  table = doc.css('table#table80')
  table_text = table.css("td[bgcolor]")
  # table.css("td[bgcolor]").first.attributes["bgcolor"].value
  inner_text = []
  # byebug
  table_text.each do |text|
    value = text.attributes["bgcolor"].value
      if value.starts_with?("#")
        inner_text.push(value)
        Color.create(name: value)
      end
  end
  # byebug
end

colors()
