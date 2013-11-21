namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
  end
end

def make_users

  #
  #admin = User.create!( name: "Dota2",
  #                      password:"wjh881213",
  #                      password_confirmation:"wjh881213")
  #admin.toggle!(:admin)
  #default_user = User.create!( name: "jiangyu",
  #                             email:"jiangyu@umail.ucsb.edu",
  #                             password:"123456",
  #                             password_confirmation:"123456")
  99.times do |n|
    name="user#{n+1}@user.com"
    password="wjh881213"
    User.create!(name: name,
                 password: password,
                 password_confirmation: password)
  end

end