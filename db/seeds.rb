# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

anz = Bank.new(name: "ANZ", email: "someone@anz.com", phone:"0405060708", days_to_confirm: 5)
anz.save

anzperson = User.new(email: "rogerpscott@gmail.com", password: "123456")
anzperson.bank = anz
anzperson.save

anzclient = Sme.new(first_name:"bob", last_name:"the builder", email:"bobthebuilder@gmail.com", phone:"0102030405", bsb:"123456", account_number:"123456789", abn:"0987654321", registered_business_name:"bob building business", bpay_biller_name:"bobbuilding")
anzclient.bank = anz
anzclient.status = "new"
