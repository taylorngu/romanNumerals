=begin 

I - 1
V - 5
X - 10
L - 50
C - 100
D - 500
M - 1000

/^M*
(C[MD]|D?C{0,3})
(X[CL]|L?X{0,3})
(I[XV]|V?I{0,3})
$/

^ - Looks beginning at the start of the string (Thanks, Dr. Morrison for the tip)
M* - Looks for 0 or more 'M's 
(C[MD]|D?C{0,3}) - Looks at the letter preceeding the optional 'M'/if 'M' is not present, the beginning of string
  C[MD] - Checks for a 'C' preceeding either a 'M' or a 'D' OR
  D?C{0,3} - Checks if there is a 'D' 0 or 1 times, followed by a 'C' up to 3 times 
(X[CL]|L?X{0,3}) - Looks at the letter preceeding the optional 'M', 'C', or 'D'/if none are present, the beginning of string
  X[CL] - Checks for an 'X' preceeding either a 'C' or a 'L' 
  L?X{0,3} - Checks if there is a 'L' 0 or 1 times, followed by an 'X' up to 3 times 
(I[XV]|V?I{0,3}) - Looks at the letter preceeding the optional 'M', 'C', 'D', 'L', or 'X'/if none are present, the beginning of string
  I[XV] - Checks for an 'I' preceeding either a 'X' or a 'V' 
  V?I{0,3} - Checks if there is a 'V' 0 or 1 times, followed by an 'I' up to 3 times 
$ - Checks for string end

=end 

def romanNumeral?(str)
  regex = /^M*(C[MD]|D?C{,3})(X[CL]|L?X{,3})(I[XV]|V?I{,3})$/
  return true ? str.match(regex) != nil : false
end

puts('Testing romanNumeral?:')
puts("Case %s: #{romanNumeral?('I') == true}" % ['I'])
puts("Case %s: #{romanNumeral?('VIII') == true}" % ['VIII'])
puts("Case %s: #{romanNumeral?('XLVIII') == true}" % ['XLVIII'])
puts("Case %s: #{romanNumeral?('CXXXIX') == true}" % ['CXXXIX'])
puts("Case %s: #{romanNumeral?('MMMCMXCIX') == true}" % ['MMMCMXCIX'])
puts("Case %s: #{romanNumeral?('MMMMMMMMMMMMMCMLXXXIV') == true}" % ['MMMMMMMMMMMMMCMLXXXIV'])
puts("Case %s: #{romanNumeral?('MMMDCCXCVII') == true}" % ['MMMDCCXCVII'])
puts("Case %s: #{romanNumeral?('IIVXXMCM') == false}" % ['IIVXXMCM'])
puts("Case %s: #{romanNumeral?('123456Keethanabcdefg') == false}" % ['123456Keethanabcdefg'])
puts("Case %s: #{romanNumeral?('/.,;!@#$%^&*()])') == false}" % ['/.,;!@#$%^&*()])'])

