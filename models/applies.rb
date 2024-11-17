require './lib/task/db'

class Apply < Sequel::Model
  many_to_one :geek
  many_to_one :job

  def to_api
    {
      id: id,
      read: read,
      invited: invited,
      job_id: job_id,
      geek_id: geek_id
    }
  end

  def self.read
    where(read: true)
  end

  def self.unread
    where(read: false)
  end

  def self.invited
    where(invited: true)
  end

  def self.uninvited
    where(invited: false)
  end
end
   