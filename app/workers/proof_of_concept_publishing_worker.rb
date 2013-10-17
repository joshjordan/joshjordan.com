class ProofOfConceptPublishingWorker
  include Celluloid

  def initialize
    schedule_next_broadcast
  end

  private

  def schedule_next_broadcast
    after(2) do
      broadcast
      schedule_next_broadcast
    end
  end

  def broadcast
    redis.publish('proof_of_concept', "Hello from pid #{Process.pid}")
  end

  def redis
    @redis ||= Redis.new
  end
end