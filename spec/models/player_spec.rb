require 'rails_helper'

RSpec.describe Player, type: :model do

    context 'Associations' do

        it 'belongs_to' do
            player = create(:player)
            expect(player.team).to be_kind_of(Team)
        end

        it 'has_many players' do
            team = create(:team, :with_players)
            expect(team.players.length).to eq(5)
        end
    end

    context '#create' do
        it 'all attributes' do
            player = create(:player)
            expect(player).to be_valid
        end

        it 'without name' do
            player = build(:player,name:nil)
            player.valid?
            expect(player.errors[:name]).to include("can't be blank")
        end

        it 'without position' do
            player = build(:player,position:nil)
            player.valid?
            expect(player.errors[:position]).to include("can't be blank")
        end
    end

    context '#destroy' do
        it 'all attributes' do
            player = create(:player)
            player.destroy
            expect(player.errors.size).to eq(0)
        end
    end

end
