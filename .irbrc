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

if ENV["RAILS_ENV"]
  IRB.conf[:PROMPT][:RAILS] = IRB.conf[:PROMPT][:DEFAULT].clone
  IRB.conf[:PROMPT][:RAILS][:PROMPT_I] = "%N(rails):%03n> "

  IRB.conf[:PROMPT_MODE] = :RAILS
end
