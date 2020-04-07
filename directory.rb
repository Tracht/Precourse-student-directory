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

def print_footer(students_list)
  puts "Overall, we have #{students_list.count} great students"
end

# potentially delte this
def print_all_students(students_list)
  students_list.each_with_index do |student, index|
    puts " #{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# don't delete this
def print_list(students_list)
  students_list.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} #{student[:cohort]} cohort"
  end
end

def filter_name_length(students_list, criteria)
  name_length = []
  students_list.each do |student|
    if student[:name].length == criteria
      name_length.push(student[:name])
    end
  end
  puts "Students with name length = #{criteria}"
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

#nothing happens until we call the methods
input_students()
print_header()
filter_students_start_with(@students, "C")
filter_name_length(@students, 4)
