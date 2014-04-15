# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Measurement.create(name: 'gr')
Measurement.create(name: 'kg')
Measurement.create(name: 'lb')
Measurement.create(name: 'oz')
Measurement.create(name: 'ml')
Measurement.create(name: 'l')
Measurement.create(name: 'cm')
Measurement.create(name: 'taza')
Measurement.create(name: 'cucharada')
Measurement.create(name: 'cucharadita')
Measurement.create(name: 'copa')
Measurement.create(name: 'pocillo de café')
Measurement.create(name: 'jarra')
Measurement.create(name: 'vaso')

LunchOption.create(name: 'Aperitivo')
LunchOption.create(name: 'Primero')
LunchOption.create(name: 'Segundo')
LunchOption.create(name: 'Postre/cóctel')
