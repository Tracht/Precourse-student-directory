def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  @students = []
  name = gets.chomp
  while ! name.empty? do
  @students << {name: name, cohort: :november}
  puts "Total students: #{@students.count}"
  name = gets.chomp
  end
  puts @students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-----------"
end

def print(students)
  students.each_with_index do |student, _index|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  print "Overall, we have #{students.count} great students"
end


input_students()
print_header()
print(@students)
# print_footer(@students)
