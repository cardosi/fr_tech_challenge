require 'csv'
customer_list = CSV.read(ARGV[0])

#Determine whether or not one or two arguments have been included and adjust accordingly
if ARGV[1] == nil
  file_name = ARGV[0].dup
  file_name.prepend("fr_formatted_")
else
  file_name = ARGV[1].dup
end

#Sort by email and remove nil values
customer_list.sort! { |a, b| a[11].to_s <=> b[11].to_s }
customer_list.each do |line|
  line.delete_if {|element| element === nil}
end

#Grouping by same email address and reverse sort by age
##If statement removes keys from grouping
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

#Taking the family groups and pulling elements from the arrays to create the desired out put format and pushing onto a CSV
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
    csv << arr
  end
end
