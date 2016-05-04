require "redis"

class ChatContext
  attr_accessor :redis_client, :chat_id

  def initialize(chat_id, redis_client=$redis)
    @redis_client = redis_client
    @chat_id = chat_id
  end

  def method_missing(m, *args, &block)
    if m =~ /.+=/
      self.add(m.to_s.gsub('=', ''), *args)
    else
      self.get(m)
    end
  end

  def get(field)
    data = redis_client.hget(context_key, field)
    JSON.parse(data) if data.present?
  rescue JSON::ParserError
    data
  end

  def set(context)
    self.clear
    redis_client.hmset(context_key, context.map { |k, v| [k, v] }.flatten)
  end

  def add(field, content)
    redis_client.hset context_key, field, content
  end

  def clear
    redis_client.del context_key
  end

  def context_key
    "bot:chat-context:#{chat_id}"
  end
end
