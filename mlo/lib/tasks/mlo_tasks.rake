desc "updating subdomain"
task :mlo do
  User.all.each do |user|
    first_part = user.first_name.split('').first rescue = ""
    second_part = user.last_name.parameterize rescue ""
    user.subdomain = first_part + second_part
    user.save
  end
end
