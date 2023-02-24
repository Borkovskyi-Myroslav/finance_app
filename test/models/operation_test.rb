require "test_helper"

class OperationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # passed
  test "return false if name is missed" do
    test_1 = Operation.new(description: "some description")
    assert_not(test_1.valid?)
  end

  # passed
  test "check the 'seven_amount' odate" do
    test_2 = Operation.find_by(odate: "2023-01-18 18:49:07")
    assert_equal(10.0, test_2.amount)
  end

  # passed
  test "check the 'transaction_type_seven' odate" do
    test_3 = Operation.find_by(odate: "2023-01-18 18:49:07")
    assert_equal("costs", test_3.transaction_type)
  end

  # passed
  test "check the 'category_five' odate " do
    test_4 = Operation.find_by(odate: "2023-01-13 18:50:00", amount: 10.5)
    # puts test_4.description
    # puts test_4.category.name
    assert(test_4.category)
  end

  # passed wrong category_id
  test "missing somthing" do
    test_5 = Operation.new(amount: 10.99,
                           odate: Time.now.to_s,
                           description: "new operations",
                           category_id: 1,
                           transaction_type: 0)
    assert_not(test_5.valid?)
  end

  # passed
  test "creation new operation 1" do
    test_6 = Operation.new(amount: 10.99,
                           odate: Time.now.to_s,
                           description: "new operations",
                           category_id: Category.second.id,
                           transaction_type: 0)
    assert(test_6.valid?)
  end

  # passed
  test "Operation find_by 'odate' " do
    test_7 = Operation.new(amount: 10.99,
                           odate: Time.now.to_s,
                           description: "new operations for test",
                           category_id: Category.second.id,
                           transaction_type: 0)
    test_7.save()
    test_7_new = Operation.find_by(odate: Time.now.to_s)
    assert_equal("new operations for test", test_7_new.description)
  end

  # passed
  test "UPDATE by 'description' two" do
    test_8 = Operation.find_by(description: "Test description")
    test_8.update(description: "New_Test description")
    # puts test_8.description
    # puts test_8.category.name
    assert_equal("New_Test description", test_8.description)
  end

  # passed
  test "UPDATE by 'Category.id' " do
    test_9 = Operation.find_by(category_id: Category.fourth.id)
    # puts test_9.description
    # puts test_9.category.name
    test_9.update(description: "New_Test description second")
    # puts test_9.description
    assert_equal("New_Test description second", test_9.description)
  end

  # passed questions
  test "destroy by 'Category.id' " do
    oper_destroy = Operation.destroy_by(category_id: Category.second.id)
    # assert_empty(Operation.destroy_by(category_id: Category.second.id))
    assert_not_empty(oper_destroy)
  end

  # passed
  test "check the 'category_1' odate" do
    medicine = Operation.find_by(description: "Test description")
    assert_equal("2023-01-14 18:50:00 UTC", medicine.odate.to_s)
  end

  # passed
  test "check the 'category_by_date' amount" do
    test_category = Operation.find_by(odate: "2023-01-13 18:50:00", amount: 10.5)
    # puts test_category.category.name
    assert_equal("2st_Category", test_category.category.name)
  end

  # reports test

  # passed
  test "return sum of amount by category " do
    start_date = "2023-01-12 18:50:00"
    end_date = "2023-01-13 18:50:00"
    # end_date = "2023-01-14 18:50:00"

    first_result = Operation.report_by_category(start_date, end_date)
    result = Hash[first_result.map { |k, v| [k, v.to_f] }]
    # puts result

    assert_equal({ "medicine" => 25, "2st_Category" => 30 }, result)
    # assert_equal({ "2st_Category" => 30, "medicine" => 25.0, "3st_Category" => 5, "category_1" => 14.5 }, result )
  end
  # passed
  test "return false  by category" do
    start_date = "2023-01-12 18:50:00"
    end_date = "2023-01-13 18:50:00"

    first_result = Operation.report_by_category(start_date, end_date)
    result = Hash[first_result.map { |k, v| [k, v.to_f] }]

    # puts result
    assert_not_equal({ "2st_Category" => 20.0, "medicine" => 15.0 }, result)
  end
  # passed
  test "return sum of amount by dates for  dates" do
    start_date = "2023-01-12 18:50:00"
    # end_date = "2023-01-13 18:50:00"
    end_date = "2023-01-14 18:50:00"
    # якщо пропустити час..то вибере тільки по датах до вказаних кінців
    first_result = Operation.report_by_dates(start_date, end_date)
    result = Hash[first_result.map { |k, v| [k.to_date.to_s, v.to_f] }]

    assert_equal({ "2023-01-12" => 34.5, "2023-01-13" => 20.5, "2023-01-14" => 19.5 }, result)
    # assert_equal({ "2023-01-12" => 34.5,  "2023-01-13" => 20.5 }, result )
  end

  # passed
  test "return false if given range of dates is not valid " do
    start_date = "2023-01-13"
    end_date = "2023-01-12"

    first_result = Operation.report_by_dates(start_date, end_date)
    result = Hash[first_result.map { |k, v| [k.to_date.to_s, v.to_f] }]

    assert_not_equal({ "2023-01-13" => 5.0, "2023-01-12" => 20.0 }, result)
  end


end
