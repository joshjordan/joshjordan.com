class ProofOfConceptConsumingWorker
  include Celluloid

  def initialize(stream)
    @stream = stream
    async.listen
  end

  private

  attr_reader :stream

  def listen
    redis.subscribe 'proof_of_concept' do |subscription|
      subscription.message do |channel, message|
        stream.send_data "#{Process.pid} received: #{message}"
      end
    end
  end

  def redis
    @redis ||= Redis.new
  end
end