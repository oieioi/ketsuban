module Ketsuban
  extend ActiveSupport::Concern

  UNLUCKY_NUMBERS = [4, 13, 42, 44, 400, 404, 444, 503]

  included do
    before_create do
      next_id = fetch_next_id
      if UNLUCKY_NUMBERS.include?(next_id)
        self.id = generate_next_id(next_id)
        increment_sequence
      end
    end
  end

  def fetch_next_id
    # FIXME: next_sequence_value が使えない
    self.class.maximum(self.class.primary_key) + 1
  end

  def generate_next_id(now_id)
    loop do
      break unless UNLUCKY_NUMBERS.include?(now_id)
      now_id = now_id + 1
    end
    now_id
  end

  def increment_sequence
    # FIXME: psqlのみ対応
    self.class.connection.set_pk_sequence!(self.class.table_name, id)
  end
end
