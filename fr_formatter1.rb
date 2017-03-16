require 'csv'
customer_list = CSV.read(ARGV[0])

#Sort By Email And Remove Nil Values##################
customer_list.sort! { |a, b| a[11] <=> b[11] }
customer_list.each do |line|
  line.delete_if {|element| element === nil}
end

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

CSV.open("test_wCaps.csv", "w+") do |csv|
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
