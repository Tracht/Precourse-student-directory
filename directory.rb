@students = [] # an empty array accessible to all methods
@student_id_counter = 1
def input_students
  input_instructions()
  input = ""
  while input != "done" || input != "edit"
      input = STDIN.gets.chomp
      if input == "done"
        break
      elsif input == "edit"
        edit_student_intro()
        edit_id = STDIN.gets.chomp.to_i
        edit_student(edit_id)
      else
        array = input.split(", ").unshift(@student_id_counter)
        print array
        @student_id_counter = array[0] #this is already integer
        name = array[1]
        cohort = array[2].to_i
        degree = array[3]
        course = array[4]
        # add the student hash to the array
        @students << {id: @student_id_counter, name: name, cohort: cohort, degree: degree, course: course}
        print count_nth_student()
        @student_id_counter += 1
      end
  end
  return @students
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:id], student[:name], student[:cohort], student[:degree], student[:course]]
    csv_line = student_data.join(",")
    file.puts csv_line #this writes to a file, instead of the output stream
  end
  file.close
end
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  id, name, cohort, degree, course = line.chomp.split(",") #parallel assignment
    @students << {id: id.to_i, name: name, cohort: cohort.to_i, degree: degree, course: course}
  end
  file.close
end
def try_load_students()
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #get out of the method if it isn't given
  if File.exists?(filename) #if file exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
  end
end

def input_instructions()
  puts "Please enter the student's name, cohort, degree (MSc, BA, BSc), & course"
  puts "To finish, type \"done\" "
  puts "----"
end
def student_details_menu()
  puts ">> Which field do you wish to edit?"
  student_details = ["student ID", "name", "cohort", "degree", "course"]
  student_details.each_with_index do |x, index|
    puts "#{index}. #{x}"
  end
  puts ">>"
end
def edit_student_intro()
  puts ">> Which student do you want to edit?"
  print_students_list()
  puts ">> Enter the student's ID"
end
def edit_student(student_id)
  puts "make edits to:"
  puts "#{@students[student_id - 1]}" #needs -1 otherwise wrong index position
  student_details_menu()
  edit_field = STDIN.gets.chomp
  puts ">> Type in the correction"
  correction = STDIN.gets.chomp
  case edit_field
    when "0" || "student ID"
      test = @students[student_id-1][:id]
      puts test
      @students[student_id - 1][:id] = correction.to_i  #:id is an integer
    when "1" || "name"
      @students[student_id - 1][:name] = correction.capitalize
    when "2" || "cohort"
      @students[student_id - 1][:cohort] = correction.to_i  #:cohort is an integer
    when "3" || "degree"
      @students[student_id - 1][:degree] = correction.capitalize
    when "4" || "course"
      @students[student_id - 1][:course] = correction.capitalize
    else
      puts "I don't understand your selection"
  end
  puts "Changes have been saved:"
  puts "#{@students[student_id - 1]}"
end

def count_nth_student()
  if @students.count == 1
    puts "Now we have #{@students.count} student"
  elsif @students.count != 1
    puts "Now we have #{@students.count} students"
  end
end
def print_header
  puts "The students of Villains Academy:"
end
def print_footer()
  if @students.count == 1
    puts ">> Overall, we have #{@students.count} great student"
    puts ""
  else
    puts ">> Overall, we have #{@students.count} great students"
    puts ""
  end
end
def print_students_list()
  @students.each do |student|
    puts "ID #{student[:id]}, #{student[:name]}, #{student[:cohort]} cohort, #{student[:degree]}, #{student[:course]}"
  end
end
def show_students_formatted
  print_header()
  print_students_list()
  print_footer()
end

def ask_name_length()
  puts ">> Filter students by name length"
  puts ">> Enter name length"
  name_length = STDIN.gets.chomp
  return name_length.to_i
end
def filter_name_length(criteria)
  name_length = []
  @students.each do |student|
    if student[:name].length <= criteria
      name_length.push(student[:name] + " " + student[:cohort])
    end
  end
  puts ">> Students with name length < or = #{criteria}"
  puts ">> Total of #{name_length.length}"
  puts name_length
end
def ask_start_with()
  puts ">> Filter students by name's first letter"
  puts ">> Enter the letter it starts with"
  start_with = STDIN.gets.chomp
  return start_with
end
def filter_students_start_with(criteria)
  start_with = []
  #Filter students
  @students.each do |student|
    start_with.push(student[:name]) if student[:name].start_with?(criteria)
  end
  if start_with.length == 1
    puts "We have #{start_with.length} student whose first name starts with #{criteria}"
    puts start_with
  else
    puts "We have #{start_with.length} students whose first name starts with #{criteria}"
    puts start_with
  end
end
def ask_cohort()
  puts ">> Filter students by cohort"
  puts ">> Enter the cohort"
  cohort = STDIN.gets.chomp.to_i
  return cohort
end
def filter_by_cohort(criteria)
  cohort = []
  @students.each do |student|
    if student[:cohort] == criteria
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
  puts "3. Save student list to students.csv"
  puts "4. Load students from students.csv"
  puts "5. Filter students by name length"
  puts "6. Filter students by first name"
  puts "7. Filter students by cohort"
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
      save_students()
    when "4"
      try_load_students()
      # load_students()
    when "5"
      name_length = ask_name_length()
      filter_name_length(name_length)
    when "6"
      start_with = ask_start_with()
      filter_students_start_with(start_with)
    when "7"
      cohort = ask_cohort()
      filter_by_cohort(cohort)
    when "9"
      exit
    else
      puts "I don't understand, try again"
  end
end
def interactive_menu
  loop do
    print_menu()
    menu_selection(STDIN.gets.chomp)
  end
end

#nothing happens until we call the methods
interactive_menu()
