require 'rails_helper'

RSpec.describe Team, type: :model do

    context 'Associations' do

        it 'belongs_to group' do
            team = create(:team)
            expect(team.group).to be_kind_of(Group)
        end
    end
    context '#create' do

        it 'all attributes' do
            team = create(:team)
            expect(team).to be_valid
        end

        it 'without name' do
            team = build(:team,name: nil)
            team.valid?
            expect(team.errors[:name]).to include("can't be blank")
        end

        it 'without code' do
            team = build(:team,code:nil)
            team.valid?
            expect(team.errors[:code]).to include("can't be blank")
        end

        it 'without group' do
            team = build(:team,group:nil)
            team.valid?
            expect(team.errors[:group]).to include("can't be blank")
        end

    end

    context '#destroy' do
        it 'all attributes' do
            team = create(:team)
            expect(team.errors.size).to eql(0)
        end
    end
end
