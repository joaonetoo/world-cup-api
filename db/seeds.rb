# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
teams = []
names_groups = %w(A B C D E F G H)
groups = []

names_groups.each do |name|
    group = Group.create(name: name)
    groups << group
end

groups_include_teams = {
        Russia: groups[0], Uruguay: groups[0],
        Egypt: groups[0], 'Saudi Arabia': groups[0],
        Spain: groups[1], Portugal: groups[1],
        'IR Iran': groups[1], Morocco: groups[1],
        France: groups[2], Denmark: groups[2],
        Australia: groups[2], Peru: groups[2],
        Croatia: groups[3], Nigeria: groups[3],
        Iceland: groups[3], Argentina: groups[3],
        Brazil: groups[4], Switzerland: groups[4],
        Serbia: groups[4], 'Costa Rica': groups[4],
        Mexico: groups[5], Germany: groups[5],
        Sweden: groups[5], 'Korea Republic': groups[5],
        Belgium: groups[6], England: groups[6],
        Panama: groups[6], Tunisia: groups[6],
        Japan: groups[7], Senegal: groups[7],
        Poland: groups[7], Colombia: groups[7]
}

team = Team.new
options = { headers: true, header_converters: :symbol }

CSV.foreach('lib/fifa.csv',options) do |row|
    player_team, player_position = row[0], row[1]
    player_name, player_age = row[2], row[4].to_i
    unless teams.include?(player_team)
        teams << player_team
        group_team = groups_include_teams[player_team.to_sym]
        code = player_team[0..2].upcase
        team = Team.create(name: player_team, code: code, group: group_team)
    end
    Player.create(name: player_name, position: player_position,
                  age: player_age, team: team)
end

CSV.foreach('lib/stadiums.csv') do |row|
    stadium_city, stadium_name = row[0], row[1]
    Stadium.create(name: stadium_name,city: stadium_city)
end

groups.each do |group|
    teams_group = group.teams
    teams_group.length.times do
        for i in (0...3) do
            game = Match.create(date: Time.at(rand * Time.now.to_i), stadium: Stadium.all.sample)
            teams_group[i].matches <<  game
            teams_group[i+1].matches << game
        end
    end
end


Player.reindex
Team.reindex
