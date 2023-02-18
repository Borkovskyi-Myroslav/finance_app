require "rails_helper"

RSpec.describe Operation, :type => :model do
  describe "#by_dates" do
    context "with valid params " do
      let(:start_date){Date.current}
      let(:end_date){1.day.from_now}
      let(:test_category) {create(:category)}
      let!(:correct_operations){create_list(:operation, 3, :odate => start_date, :category => test_category)}
      let!(:incorrect_operations){create_list(:operation, 3, :odate => 10.days.from_now.to_date, :category => test_category)}
      it 'should return correct operation' do
        expect(described_class.by_dates(start_date, end_date)).to eq(correct_operations)
      end
    end

    context "with invalid params " do
      let(:start_date){1.day.from_now}
      let(:end_date){10.day.from_now}
      let(:test_category) {create(:category)}
      let!(:correct_operations){create_list(:operation, 3, :odate => Date.current, :category => test_category)}

      it 'should return correct operation' do
        expect(described_class.by_dates(start_date, end_date)).to be_empty
      end
    end
  end

  # test category
  # describe "#by_category" do
  #   context "with valid params " do
  #
  #     #let(:test_category) {create(:category)}
  #     let!(:correct_categories){create_list(:category, 1, :name => category.name)}
  #     it 'should return correct operation' do
  #       #expect(described_class.by_category(name)).to be true
  #       expect(category.name).to be true
  #       #.not_to be_empty
  #
  #     end
  #   end
  #
  #   context "with invalid params " do
  #
  #     let(:test_category) {create(:category)}
  #     let!(:correct_operations){create_list(:operation, 3, :odate => Date.current, :category => test_category)}
  #
  #     it 'should return correct operation' do
  #       expect(described_class.by_dates(start_date, end_date)).to be_empty
  #     end
  #   end
  #
  # end
end

