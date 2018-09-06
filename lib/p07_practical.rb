require_relative 'p05_hash_map'

def can_string_be_palindrome?(string) 
    map = HashMap.new(string.length)
    false_count = 0
   
    string.chars.each do |char|
        if map.include?(char)
            map[char] = true
            false_count -= 1
            p false_count
            # p map[char]
        else
            map[char] = false
            false_count += 1
            # p map[char]
        end
    end

    
    false_count > 1 ? false : true
end
