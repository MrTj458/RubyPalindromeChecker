require "pry"
class PalindromeChecker
  def  initialize
  end

  def start
    puts "Enter a word"
    puts "Type quit to stop"
    user_input = gets.chomp.downcase
    exit if user_input == "quit"
    is_palindrome = check_for_palindrome(user_input)
    if is_palindrome
      puts "It is a palindrome"
    else
      puts "It is not a palindrome"
    end
  end

  def check_for_palindrome(user_input)
    is_palindrome = false
    user_input = remove_special_characters(user_input)
    reversed_string = reverse_string(user_input)
    string_to_check = remove_special_characters(reversed_string)
    if string_to_check == user_input
      is_palindrome = true
    end
    return is_palindrome
  end

  def reverse_string(string)
    new_string = []
    string_array = string.split('')
    string_array.each do |letter|
      new_string.unshift(letter)
    end

    return new_string.join
  end

  def remove_special_characters(string)
    temp_array = string.split('')

    index = 0
    while index < temp_array.length
      if /[.?'?,?\-?!?\s?"?`?:?;?]+/.match(temp_array[index])
        temp_array.delete_at(index)
        index -= 1
      end
      index += 1
    end

    return temp_array.join
  end
end

checker = PalindromeChecker.new
while true
  checker.start
end