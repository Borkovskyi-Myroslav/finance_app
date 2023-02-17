require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


test "check the 'medicine' description" do
  medicine = Category.find_by(name: 'medicine')
  assert_equal("medicine_description", medicine.description)
end
#
#
test "return true if everything is good" do
  new_category = Category.new(name: "new category", description: "new description")
  assert(new_category.valid?)
end
#
test "return false if name is missed" do
  new_category = Category.new(description: "some description")
  assert_not(new_category.valid?)
end
#
test "saving and gathering" do
  new_category = Category.new(name: "new category", description: "new description")
  new_category.save()
  new_cat = Category.find_by(name: "new category")
  assert_equal("new description", new_cat.description)
end



test "update by " do

  update_1 = Category.find_by_name("2st_Category")
  update_1.update(description: "new description")

  assert_equal("new description", update_1.description)

end


test "update 3 by " do
  #puts Category.all.pluck("id")
  update_3 = Category.find_by_name("2st_Category")
  update_3.update(name: "new_name")

  assert_equal("new_name", update_3.name)

end

# ніфіга не понятно

# test "delete " do
#   treed = Category.destroy_by(name: "2st_Category")
#   assert_empty(Category.destroy_by(name: "2st_Category"))
#   #assert_not_empty(treed)
# end

end