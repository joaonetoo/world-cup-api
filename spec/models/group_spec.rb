require 'rails_helper'

RSpec.describe Group, type: :model do
    context '#create' do
        it 'all attributes' do
            group = create(:group)
            expect(group).to be_valid
        end

        it 'without name' do
            group = build(:group, name: nil)
            group.valid?
            expect(group.errors[:name]).to include("can't be blank")
        end
    end
    context '#destroy' do
        it 'all atributtes' do
            group = create(:group)
            group.destroy
            expect(group.errors.size).to eql(0)
        end
    end
end
