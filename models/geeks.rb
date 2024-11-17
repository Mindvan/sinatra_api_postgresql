require './lib/task/db'

class Geek < Sequel::Model
  one_to_many :applies

  def to_api
    {
      id: id,
      name: name,
      stack: stack,
      resume: resume
    }
  end

end