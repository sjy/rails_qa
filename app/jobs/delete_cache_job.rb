class DeleteCacheJob < ApplicationJob
  queue_as :default

  def perform(cache_key_pattern)
    Rails.cache.delete_matched(cache_key_pattern)
  end
end
