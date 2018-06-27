class PlayersJsonCacheWorker
  include Sidekiq::Worker

  def perform(*args)
    players = Player.all
    Rails.cache.fetch(Player.cache_keys(players)) do
      players
    end
  end
end
