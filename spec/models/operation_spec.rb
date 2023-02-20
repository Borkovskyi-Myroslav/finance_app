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

    context ' without an amount' do
      it 'is not valid without an amount' do
        operation = build(:operation, amount: nil)
        expect(operation).not_to be_valid
      end
    end

    context 'valid' do
      it 'is valid with valid attributes' do
        operation = build(:operation, amount: 200)
        expect(operation.amount.to_i).to eq(200)
      end
    end


  end

  #test category
  describe "#by_category" do

      context "with invalid params a name " do
      it 'is not valid without a name' do
        category = build(:category, name: nil)
        expect(category).not_to be_valid
      end
    end

    context "with valid params " do
    it 'is  valid wit all params' do
      category = build(:category)
      expect(category.name).not_to be_empty
    end
    end

    context "testing update" do
      it 'test update params' do
        category = build(:category)
        category.update(name: "new name")
        expect(category.name).to eq("new name")
      end
    end



  end


  end



