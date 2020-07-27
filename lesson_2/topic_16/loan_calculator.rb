def prompt(message)
  puts ">> #{message}"
end

def number?(obj)
  obj = obj.to_s unless obj.is_a?(String)
  /\A[+]?\d+(\.[\d]+)?\z/.match(obj)
end

prompt 'Welcome to Loan Calculator!'

loop do
  principal = ''
  loop do
    prompt 'What is the total amount of the loan?'
    principal = gets.chomp

    break if number?(principal)

    prompt 'Please enter a valid loan amount:'
  end

  annual_percentage_rate = ''
  loop do
    prompt 'What is the annual percentage rate (APR) of the loan?'
    annual_percentage_rate = gets.chomp

    break if number?(annual_percentage_rate)

    prompt 'Please enter a valid APR:'
  end

  term_in_years = ''
  loop do
    prompt 'What is the loan term (in years)?'
    term_in_years = gets.chomp

    break if number?(term_in_years)

    prompt 'Please enter a valid loan term:'
  end

  monthly_interest_rate = annual_percentage_rate.to_f * 0.01 / 12
  term_in_months = term_in_years.to_i * 12
  monthly_payment = principal.to_i * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**-term_in_months))

  prompt "Your monthly payment is $#{monthly_payment.round(2)}."

  prompt 'Calculate another monthly payment?'
  answer = gets.chomp

  break unless answer.downcase.start_with? 'y'
end

prompt 'Thank you for using Loan Calculator! Goodbye!'
