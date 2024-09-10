puts "This is your new bank account. Enter first deposit:"
balance = gets.chomp.to_i
puts "Opened your account with balance: #{balance}$"
puts "Default interest is 3.7%"
loan = 0
choice = true

def deposit(balance)
  puts "--------------------\nCurrent Balance: #{balance}$\n--------------------"
  puts "How much do you want to deposit? "
  new_balance = balance + gets.chomp.to_i
  puts "--------------------\nNew Balance: #{new_balance}$\n--------------------"
  new_balance
end

def withdraw(balance)
  puts "--------------------\nCurrent Balance: #{balance}$\n--------------------"
  puts "How much do you want to withdraw? "
  new_balance = balance - gets.chomp.to_i
  if balance < new_balance
    puts "You're trying to withdraw too much, insufficient fund"
    balance
  else
    puts "--------------------\nNew Balance: #{new_balance}$\n--------------------"
    new_balance
  end
end

def wait(balance)
  interest = 3.7
  puts "How many days do you want to wait? "
  days = gets.chomp.to_i
  new_balance =  balance + (days * ((balance * (interest / 100))/365)).round(2)
  puts "--------------------\nCurrent Balance: #{balance}$\n--------------------"
  new_balance
end

def loan(loan)
  puts "What loan do you want to take out?"
  new_loan = loan + gets.chomp.to_i
  new_loan
end

while choice
  if loan > 0
    puts "--------------------\nCurrent Loan: #{loan}$\n--------------------"
    puts "You have to pay back the loan in 60 days"
  end
  puts "--------------------\nCurrent Balance: #{balance}$\n--------------------"
  puts "Do you want to deposit, withdraw, wait, loan or exit (1/2/3/4/5): "
  choice = gets.chomp.to_i
  case choice
  when 1
    balance = deposit(balance)
  when 2
    balance = withdraw(balance)
  when 3
    balance = wait(balance)
  when 4
    loan = loan(loan)
  when 5
    choice = false
  else
    puts "Invalid input"
  end
end