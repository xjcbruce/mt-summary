class MagicParam < ActiveRecord::Base

  @@default_record = nil

  def self.default
    if @@default_record.nil?
      @@default_record = MagicParam.first
    end
    @@default_record
  end

end
