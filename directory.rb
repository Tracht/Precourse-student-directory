@students = [] # an empty array accessible to all methods

def input_students
  name = ""
  input_students_instructions()
  name = get_student_name()
  while name != "done" do
      name = edit_name(name)
    puts "Enter student's cohort"
      cohort = gets.chomp
      cohort = edit_cohort(cohort)
    puts "Enter student's degree: MSc, BA, BSc"
      degree = gets.chomp
      degree = edit_degree(degree)
    puts "Enter student's course, i.e. Maths"
      course = gets.chomp
      course = edit_course(course)
    # add the student hash to the array
    @students << {name: name, cohort: cohort, degree: degree, course: course}
    count_print_all_students()
    name = get_student_name()
  end
  return @students
end

def input_students_instructions()
  puts "Please enter the student's name, cohort, degree, & course"
  puts "To finish, type \"done\" "
  puts "----"
end

def get_student_name()
  puts "Enter student's name"
  name = gets.chomp
  return name
end

def count_print_all_students()
  if @students.count == 1
    puts "Now we have #{@students.count} student"
  elsif @students.count != 1
    puts "Now we have #{@students.count} students"
  end
end

def edit_name(name)
  puts ">> Would you like to edit their name? Type yes or no"
  edit_name = gets.chomp.downcase
  loop do
    if edit_name == "yes"
      puts ">> Edit name"
      name = gets.chomp
      puts ">> Name has been updated"
      break
    elsif edit_name == "no"
      break
    else
      puts ">> I don't understand, try again"
    end
  end
  return name
end

def edit_cohort(cohort)
  puts ">> Would you like to edit the cohort? Type yes or no"
  edit_cohort = gets.chomp.downcase
  loop do
    if edit_cohort == "yes"
      puts ">> Edit cohort"
      cohort = gets.chomp
      puts ">> Cohort has been updated"
      repeat = false
      break
    elsif edit_cohort == "no"
      break
    else
      puts ">> I don't understand, try again"
    end
  end
  return cohort
end

def edit_degree(degree)
  puts ">> Would you like to edit the degree? Type yes or no"
  edit_degree = gets.chomp.downcase
  loop do
    if edit_degree == "yes"
      puts ">> Edit degree"
      degree = gets.chomp
      puts ">> Degree has been updated"
      break
    elsif edit_degree == "no"
      break
    else
      puts ">> I don't understand, try again"
    end
  end
  return degree
end

def edit_course(course)
  puts ">> Would you like to edit the course? Type yes or no"
  edit_course = gets.chomp.downcase
  loop do
    if edit_course == "yes"
      puts ">> Edit course"
      course = gets.chomp
      puts ">> Course has been updated"
      break
    elsif edit_course == "no"
      break
    else
      puts ">> I don't understand, try again"
    end
  end
  return course
end

def print_header
  puts "The students of Villains Academy:"
end

def print_footer()
  puts ">>"
  if @students.count == 1
    puts ">> Overall, we have #{@students.count} great student"
    puts ""
  else
    puts ">> Overall, we have #{@students.count} great students"
    puts ""
  end
end

def print_students_list()
  @students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]}, #{student[:cohort]} cohort, #{student[:degree]} of #{student[:course]}"
  end
end

def show_students_formatted
  print_header()
  print_students_list()
  print_footer()
end

def filter_name_length(criteria)
  name_length = []
  @students.each do |student|
    if student[:name].length <= criteria
      name_length.push(student[:name] + " " + student[:cohort])
    end
  end
  puts "Students with name length < or = #{criteria}"
  puts "total of: #{name_length.length}"
  puts name_length
end

def filter_students_start_with(criteria=nil)
  start_with = []
  #Filter students
  @students.each do |student|
    start_with.push(student[:name]) if criteria != nil && student[:name].start_with?(criteria)
  end
  #Print filtered list
  if criteria == nil
    print_footer(@students)
    print_list(@students)
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

def filter_by_cohort(criteria)
  cohort = []
  @students.each do |student|
    if student[:cohort] == criteria.to_s
      cohort.push(student[:name] + " " + student[:degree] +  " " + student[:course])
    end
  end
  puts "Students in the cohort of #{criteria}"
  puts "total of: #{cohort.length}"
  puts cohort
end

def print_menu()
  puts "----MENU----"
  puts "1. Input the students"
  puts "2. Show all students"
  puts "3. Filter students by name length"
  puts "4. Filter students by first name"
  puts "5. Filter students by cohort"
  puts "9. Exit"
  puts "-----------"
  puts ">> Select an option from the menu"
end

def menu_selection(selection)
  case selection
    when "1"
      students = input_students
    when "2"
      show_students_formatted()
    when "3"
      filter_name_length()
    when "4"
      filter_students_start_with()
    when "5"
      filter_by_cohort()
    when "9"
      exit
    else
      puts "I don't understand, try again"
  end
end

def interactive_menu
  loop do
    print_menu()
    menu_selection(gets.chomp)
  end
end

#nothing happens until we call the methods
interactive_menu()
