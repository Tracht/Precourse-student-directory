def input_students
  puts "Please enter the student's"
  puts "name, cohort, degree, and course"
  puts "To finish, type \"done\" "
  # create an empty array
  students = []
  name = gets.chomp
  while name != "done" do
    cohort = gets.chomp
    degree = gets.chomp
    course = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: cohort, degree: degree, course: course}
      if students.count == 1
        puts "Now we have #{students.count} student"
      elsif students.count != 1
        puts "Now we have #{students.count} students"
      end
      # get the next name
      name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]}, #{student[:cohort]} cohort, #{student[:degree]} of #{student[:course]}"
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
  new_array = []
  students_list.map do |student|
    if student[:cohort] == criteria.to_s
      new_array.push(student[:name] + ", " + student[:degree] +  ", " + student[:course])
    end
  end
  puts "Students in the cohort of #{criteria}"
  puts "total of: #{new_array.count}"
  puts new_array
end

def typo_correction()

end

def interactive_menu
  students = []
  loop do
    # 1. Print the menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. Read the input and save it into a variable
    selection = gets.chomp
    # 3. Do what the user asked
    case selection
      when "1"
        # input students
        students = input_students
      when "2"
        # show students
        print_header()
        print1(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't understand, try again"
    end
  end
end

#nothing happens until we call the methods
interactive_menu()
