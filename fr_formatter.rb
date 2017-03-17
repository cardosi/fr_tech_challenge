require 'csv'
customer_list = CSV.read(ARGV[0])

if ARGV[1] == nil
  file_name = ARGV[0].dup
  file_name.prepend("fr_formatted_")
else
  file_name = ARGV[1].dup
end

#Sort By Email And Remove Nil Values##################
customer_list.sort! { |a, b| a[11].to_s <=> b[11].to_s }
customer_list.each do |line|
  line.delete_if {|element| element === nil}
end

#Grouping By Same Email Address And Reverse Sort By Age
##If Statement Removes Keys From Grouping
fam_list = []
customer_list.group_by(&:last).each do |fam|
  fam.each do |person|
    if person.class == Array
      person.sort! { |a, b| a[4].to_i <=> b[4].to_i }
      person.reverse!
      fam_list << person
    end
  end
end

CSV.open(file_name, "w+") do |csv|
  fam_list.each do |fam|
    arr = []
    parent = fam[0]
    arr << parent[1].capitalize
    arr << parent[2].capitalize
    arr << parent[3]
    (1...fam.length).each do |n|
      arr << fam[n][2].capitalize
      arr << fam[n][3]
    end
    p arr
    csv << arr
  end
end
