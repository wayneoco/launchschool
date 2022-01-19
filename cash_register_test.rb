require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(20)
  end

  def test_accept_money
    @transaction.amount_paid = 20
    @register.accept_money(@transaction)
    assert_equal 120, @register.total_money
  end

  def test_change
    @transaction.amount_paid = 30
    assert_equal 10, @register.change(@transaction)
    @transaction.amount_paid = 20
    assert_equal 0, @register.change(@transaction)
    @transaction.amount_paid = 10
    assert_equal -10, @register.change(@transaction)
  end

  def test_give_receipt
    receipt = "You've paid $#{@transaction.item_cost}.\n"
    assert_output(receipt) { @register.give_receipt(@transaction) }
  end
end

class TransactionTest < MiniTest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(20)
    input = StringIO.new("20\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 20, transaction.amount_paid
  end
end
