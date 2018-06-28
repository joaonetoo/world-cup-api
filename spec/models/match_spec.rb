require 'rails_helper'

RSpec.describe Match, type: :model do
    context '#create' do
        it 'all attributes' do
            match = create(:match)
            expect(match).to be_valid
        end

        it 'without date' do
            match = build(:match, date:nil)
            match.valid?
            expect(match.errors[:date]).to include("can't be blank")
        end

        it 'without stadium' do
            match = build(:match, stadium:nil)
            match.valid?
            expect(match.errors[:stadium]).to include("must exist")
        end
    end

    context '#destroy' do
        it 'all atributtes' do
            match = create(:match)
            match.destroy
            expect(match.errors.size).to eql(0)
        end
    end
end
