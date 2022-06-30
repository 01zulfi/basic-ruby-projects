# 65..91 ascii codes for A..Z
# 97..122 ascii codes for a..z
RANGES_TO_ACCEPT = [65..90, 97..122]

def shift number, shift_factor 
    range = number_in_which_range(number)
    shifted = number + shift_factor
    if [shifted].all? range 
        shifted
    else 
        if shifted > range.max  
            wrap_by = shifted - range.max
            return range.min + wrap_by - 1
        else
            wrap_by = shifted - range.min
            ans = range.max - wrap_by - 1
            return range.max - wrap_by - 1
        end
    end
end

def is_number_between_ranges_to_accept number
    [number].all?(RANGES_TO_ACCEPT[0]) || [number].all?(RANGES_TO_ACCEPT[1])
end

def number_in_which_range number
    [number].all?(RANGES_TO_ACCEPT[0]) ? RANGES_TO_ACCEPT[0]: RANGES_TO_ACCEPT[1]
end

def shift_array_based_on_factor array, shift_factor 
    array.map do |ascii_value|  
        should_shift = is_number_between_ranges_to_accept(ascii_value)
        if should_shift 
            shift(ascii_value, shift_factor)
        else
            ascii_value
        end
    end
end

def caesar_cipher text, shift_factor
    ascii_array = text.chars.map {|character| character.ord}
    shifted_array = shift_array_based_on_factor(ascii_array, shift_factor)
    updated_characters_array = shifted_array.map { |shifted_ascii_value| shifted_ascii_value.chr }
    updated_characters_array.join 
end

