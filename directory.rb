def input_students
  puts "Please enter the names of the students"
  puts "To finish, just type \"done\" "
  # create an empty array
  @students = []

  name = gets.chomp
  while name != "done" do
    cohort = gets.chomp
    degree = gets.chomp
    course = gets.chomp
    # add the student hash to the array
    @students << {name: name, cohort: cohort, degree: degree, course: course}
      if @students.count == 1
        puts "Now we have #{@students.count} student"
      elsif @students.count != 1
        puts "Now we have #{@students.count} students"
      end
      # get the next name
      name = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print_footer(students_list)
  puts "Overall, we have #{students_list.count} great students"
end

def print_list(students_list)
  students_list.each_with_index do |student, index|
    puts " #{index+1}. #{student[:name]}, #{student[:cohort]} cohort, #{student[:degree]} of #{student[:course]} "
  end
end

def filter_name_length(students_list, criteria)
  name_length = []
  students_list.each do |student|
    if student[:name].length <= criteria
      name_length.push(student[:name] + " " + student[:cohort])
    end
  end
  puts "Students with name length < or = #{criteria}"
  puts "total of: #{name_length.length}"
  puts name_length
end

def filter_students_start_with(students_list, criteria=nil)
  start_with = []
  #Filter students
  students_list.each do |student|
    start_with.push(student[:name]) if criteria != nil && student[:name].start_with?(criteria)
  end
  #Print filtered list
  if criteria == nil
    print_footer(students_list)
    print_list(students_list)
  elsif start_with.length == 1
    puts "We have #{start_with.length} student whose first name starts with #{criteria}"
    print_list(start_with)
  elsif start_with.length > 1
    puts "We have #{start_with.length} students whose first name starts with #{criteria}"
    print_list(start_with)
  elsif start_with.length == 0
    puts "We have #{start_with.length} students whose first name starts with #{criteria}"
  end
end

def filter_by_cohort_each(students_list, criteria)
  cohort = []
  students_list.each do |student|
    if student[:cohort] == criteria.to_s
      cohort.push(student[:name] + " " + student[:degree] +  " " + student[:course])
    end
  end
  puts "Students in the cohort of #{criteria}"
  puts "total of: #{cohort.length}"
  puts cohort
end

def filter_by_cohort_map(students_list, criteria)
  puts "Students in the cohort of #{criteria}"
  students_list.map do |student|
    if student[:cohort] == criteria.to_s
      puts student[:name] + " " + student[:degree] +  " " + student[:course]
    end
  end
end

#nothing happens until we call the methods
input_students()
# print_header()
# print_list (@students)
# filter_students_start_with(@students, "C")
# filter_name_length(@students, 4)
filter_by_cohort_map(@students, 2020)
filter_by_cohort_each(@students, 2020)
