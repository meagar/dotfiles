Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'
Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 'u', 'up'

#Pry.run_command 'sorbet-unwrap' if defined?(Sorbet)

p self

def Kernel.count_queries(&block)
  semaphore = Thread::Mutex.new
  query_count = 0
  sub = ActiveSupport::Notifications.subscribe("sql.active_record") do |name, started, finished, unique_id, payload|
    semaphore.synchronize do
      query_count += 1
    end
  end

  yield

  query_count
ensure
  ActiveSupport::Notifications.unsubscribe(sub) if sub
end
