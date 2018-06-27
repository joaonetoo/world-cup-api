class Player < ApplicationRecord
  searchkick
  belongs_to :team, touch: true
  validates_presence_of :team
  after_save :create_json_cache
  validates :name, :position, :age, presence: true, on: :create
  # after_commit :reindex_team

  # def reindex_team
  #   team.reindex
  # end

  # def search_data
  #   {
  #     name: name
  #   }
  # end

  private
    def self.cache_keys(players)
    {
        serializer: 'players',
        stat_record: players.maximum(:updated_at)
    }
  end

  def create_json_cache
    PlayersJsonCacheWorker.perform_async
  end


end
