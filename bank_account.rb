class Loan
  attr_accessor :amount, :monthly
  def initialize(amount,loan)
    @id = loan.length + 1
    @amount = amount
    @monthly = @amount * 0.1
  end
  def self.monthly
    @monthly
  end
  def self.amount
    @amount
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
  new_balance = balance - gets.chomp.to_i
  if 0 > new_balance
    puts "You're trying to withdraw too much, insufficient fund"
    balance
  else
    puts "--------------------\nNew Balance: #{new_balance}$\n--------------------"
    new_balance
  end
end

def wait(balance, loan)
  interest = 3.7
  puts "How many days do you want to wait? "
  days = gets.chomp.to_i
  new_balance =  balance + (days * ((balance * (interest / 100))/365)).round(2)
  puts "--------------------\nCurrent Balance: #{balance}$\n--------------------"
  if loan.length > 0
    loan.each { |i|
      ((days / 30).floor).times do
        i.amount = i.amount - i.monthly
        new_balance = new_balance - i.monthly
        end
    }
  end
  new_balance
end

def loans(loan)
  puts "Interest is 10%\nWhat loan do you want to take out? "
  new_loan = Loan.new(gets.chomp.to_i, loan)
  loan.append(new_loan)
end

def pay_loan(loan, id)
  puts id
  puts loan[id-1]
end

while choice
  if loan.length > 0
    puts "--------------------\n"
    loan.each { |i|
      i.info
    }
    puts "--------------------"
  end
  puts "--------------------\nCurrent Balance: #{balance}$\n--------------------"
  puts "Do you want to deposit, withdraw, wait, loan or delete account (1/2/3/4/5): "
  choice = gets.chomp.to_i
  case choice
  when 1
    balance = deposit(balance)
  when 2
    balance = withdraw(balance)
  when 3
    balance = wait(balance, loan)
  when 4
    loan = loans(loan)
  when 5
    choice = false
  else
    puts "Invalid input"
  end
end