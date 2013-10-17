class ProofOfConceptController < ApplicationController
  include Tubesock::Hijack

  def show
  end

  def stream
    hijack do |websocket|
      websocket.onopen do
        websocket.send_data "Hooked up to #{Process.pid}"
        @worker = ProofOfConceptConsumingWorker.new(websocket)
      end
      websocket.onclose do
        @worker.terminate
      end
    end
  end
end