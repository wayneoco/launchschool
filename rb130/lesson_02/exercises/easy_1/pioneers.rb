# frozen_string_literal: true

LETTERS = ('a'..'z').to_a.freeze

def decipher(name)
  name.chars.map do |char|
    # return the character if it's non-alphabetic
    next char if (/[^a-zA-Z]/).match?(char)

    # set the index number of the alphabetic character to return from LETTERS
    index = char_index(char.downcase)
    # return an uppercase letter if the original letter was uppercase
    /[[:upper:]]/.match?(char) ? LETTERS[index].upcase : LETTERS[index]
  end.join('')
end

def char_index(char)
  index = LETTERS.index(char)
  (0..12).include?(index) ? index + 13 : index - 13
end

p decipher('Nqn Ybirynpr')
p decipher('Tenpr Ubccre')
p decipher('Nqryr Tbyqfgvar')
p decipher('Nyna Ghevat')
p decipher('Puneyrf Onoontr')
p decipher('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p decipher('Wbua Ngnanfbss')
p decipher('Ybvf Unvog')
p decipher('Pynhqr Funaaba')
p decipher('Fgrir Wbof')
p decipher('Ovyy Tngrf')
p decipher('Gvz Orearef-Yrr')
p decipher('Fgrir Jbmavnx')
p decipher('Xbaenq Mhfr')
p decipher('Fve Nagbal Ubner')
p decipher('Zneiva Zvafxl')
p decipher('Lhxvuveb Zngfhzbgb')
p decipher('Unllvz Fybavzfxv')
p decipher('Tregehqr Oynapu')
