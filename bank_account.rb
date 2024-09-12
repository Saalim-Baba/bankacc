class Loan
  attr_accessor :amount, :monthly
  def initialize(amount, loan)
    @id = loan.length + 1
    @amount = amount
    @monthly = (@amount * 0.1).round(2)
  end

  def info
    puts "ID: #{@id}"
    puts "Loan Amount remaining: #{@amount}$"
    puts "Monthly payment: #{@monthly}$"
  end
end

puts "This is your new bank account. Enter first deposit:"
balance = gets.chomp.to_i
puts "Opened your account with balance: #{balance}$"
puts "Personal interest is 3.7%"
loan = []
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
  amount = gets.chomp.to_i
  new_balance = balance - amount
  if new_balance < 0
    puts "You're trying to withdraw too much, insufficient funds"
    balance
  else
    puts "--------------------\nNew Balance: #{new_balance}$\n--------------------"
    new_balance
  end
end

def wait(balance, loan)
  """
  waiting a certain amount of days to get interest
  function calculates accrued interest and pays off the loan if there's one

  """
  interest = 3.7
  puts "How many days do you want to wait? "
  days = gets.chomp.to_i
  if days <= 0
    puts "You cannot wait negative days!"
    return balance
  end
  interest_accrued = (days * ((balance * (interest / 100)) / 365)).round(2)
  new_balance = balance + interest_accrued
  puts "--------------------\nInterest accrued: #{interest_accrued}$\nNew Balance: #{new_balance}$\n--------------------"

  if loan.length > 0
    loan.each do |i|
      months = (days / 30).floor
      months.times do
        if i.amount <= i.monthly
          new_balance -= i.amount
          puts "Loan ID #{i.instance_variable_get(:@id)} fully paid off!"
          # wanted to try instance_variable_get function here instead of attr_accessor
          loan.delete(i)
          break
        else
          new_balance -= i.monthly
          i.amount -= i.monthly
        end
      end
    end
  end
  new_balance
end

def loans(loan)
  """
  function to take out a loan
  creates new object and adds to already existing array called loan
  """
  puts "Interest is 10%\nWhat loan amount do you want to take out? "
  amount = gets.chomp.to_i
  if amount <= 0
    puts "Cannot grant loan that is negative or zero"
    return loan
  end
  new_loan = Loan.new(amount, loan)
  loan << new_loan
  #This is a new concept for me: << is to add at the end of array
end

while choice
  if loan.length > 0
    puts "--------------------\n"
    loan.each(&:info)
    puts "--------------------"
  end
  puts "--------------------\nCurrent Balance: #{balance}$\n--------------------"
  puts "Do you want to deposit, withdraw, wait, loan, or delete account (1/2/3/4/5): "
  choice = gets.chomp.to_i
  case choice
  when 1
    balance = deposit(balance)
  when 2
    balance = withdraw(balance)
  when 3
    balance = wait(balance, loan)
  when 4
    loans(loan)
  when 5
    choice = false
  else
    puts "Invalid input"
  end
end
