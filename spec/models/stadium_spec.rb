require 'rails_helper'

RSpec.describe Stadium, type: :model do

    context '#create' do

        it 'all attributes' do
            stadium = create(:stadium)
            expect(stadium).to be_valid
        end

        it 'without city' do
            stadium = build(:stadium,city: nil)
            stadium.valid?
            expect(stadium.errors[:city]).to include("can't be blank")
        end

        it 'without name' do
            stadium = build(:stadium,name:nil)
            stadium.valid?
            expect(stadium.errors[:name]).to include("can't be blank")
        end
    end

    context '#destroy' do
        it 'all attributes' do
            stadium = create(:stadium)
            expect(stadium.errors.size).to eql(0)
        end
    end
end
