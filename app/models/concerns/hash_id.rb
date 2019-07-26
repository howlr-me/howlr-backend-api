# frozen_string_literal: true

module HashId
  extend ActiveSupport::Concern

  def hashids
    alphabet = 'abcdefghijklmnopqrstuvwxyz' \
                'ABCDEFGHIJKLMNOPQRSTUVWXYZ' \
                '1234567890'

    Hashids.new('salt', 8, alphabet)
  end

  def encode_id(id)
    hashids.encode_hex(id.to_s)
  end

  def decode_id(id)
    hashid_decode(id)
  end

  private

  def hashid_decode(id)
    hashids.decode_hex(id.to_s)
  end
end
