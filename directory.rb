# Lets put all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  @students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
      if @students.count == 1
        puts "Now we have #{@students.count} student"
      elsif @students.count != 1
        puts "Now we have #{@students.count} students"
      end
    #get another name from the user
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def print(students)
  students.each_with_index do |student, index|
    puts " #{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_list(list)
  list.each do |x|
    puts x
  end
end

def print_and_filter_students(students_list, criteria=nil)
  start_with = []
  #Filter students
  students_list.each_with_index do |student, index|
    start_with.push(student[:name]) if criteria != nil && student[:name].start_with?(criteria)
  end
  #Print filtered list
  if criteria == nil
    print(students_list)
    print_footer(students_list)
  elsif start_with.length == 0
    puts "We have #{start_with.length} students whose first name starts with #{criteria}"
  elsif start_with.length > 1
    puts "We have #{start_with.length} students whose first name starts with #{criteria}"
    print_list(start_with)
  elsif start_with.length == 1
    puts "We have #{start_with.length} student whose first name starts with #{criteria}"
    print_list(start_with)
  end
end

#nothing happens until we call the methods
input_students()
print_header()
print_and_filter_students(@students, "C")
