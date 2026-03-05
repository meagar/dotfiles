# typed: false
# frozen_string_literal: true

def cq
  semaphore = Thread::Mutex.new
  query_count = 0
  raise "cq requires a block" unless block_given?

  sub = ActiveSupport::Notifications.subscribe("sql.active_record") do |name, started, finished, unique_id, payload|
    semaphore.synchronize do
      query_count += 1
    end
  end

  yield
ensure
  warn "Query count: #{query_count}"
  ActiveSupport::Notifications.unsubscribe(sub) if sub
end

module GC
  def self.time_in_gc
    before = GC.total_time
    yield
    diff_ms = (GC.total_time - before) / 1_000_000.0

    puts "GC time: #{diff_ms.round(2)}ms"
  end

  def self.count_allocations
    GC.start
    initial_freed_objects = GC.stat(:total_freed_objects)

    yield

    GC.start
    final_freed_objects = GC.stat(:total_freed_objects)

    puts "GC'd objects: #{final_freed_objects - initial_freed_objects}"
  end
end

if ENV["RAILS_ENV"]
  IRB.conf[:PROMPT][:RAILS] = IRB.conf[:PROMPT][:DEFAULT].clone
  IRB.conf[:PROMPT][:RAILS][:PROMPT_I] = "%N(rails):%03n> "

  IRB.conf[:PROMPT_MODE] = :RAILS
end



