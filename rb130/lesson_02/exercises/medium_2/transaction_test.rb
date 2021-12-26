require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < MiniTest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(20)
  end

  def test_prompt_for_payment
    input = StringIO.new("30\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(30, @transaction.amount_paid)
  end
end
