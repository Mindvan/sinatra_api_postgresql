Sequel.seed(:development, :test) do # Applies only to "development" and "test" environments
  def run
    puts 'Start truncate for all models'
    DB[:applies].truncate(cascade: true, restart: true)
    DB[:geeks].truncate(cascade: true, restart: true)
    DB[:jobs].truncate(cascade: true, restart: true)
    DB[:companies].truncate(cascade: true, restart: true)
    puts 'Models truncated'

    DB[:applies].insert(job_id: 1, geek_id: 1, read: true, invited: true)
    DB[:applies].insert(job_id: 1, geek_id: 2, read: false, invited: false)
    DB[:applies].insert(job_id: 5, geek_id: 5, read: true, invited: false)
    DB[:applies].insert(job_id: 6, geek_id: 8, read: false, invited: false)

    DB[:geeks].insert(name: 'Mike', stack: 'Sinatra React', resume: true)
    DB[:geeks].insert(name: 'Alex', stack: 'Ruby React', resume: true)
    DB[:geeks].insert(name: 'Martha', stack: 'Rails', resume: false)
    DB[:geeks].insert(name: 'Juri', stack: 'Java', resume: true)
    DB[:geeks].insert(name: 'Andrew', stack: 'PHP', resume: false)
    DB[:geeks].insert(name: 'Nina', stack: 'Node', resume: true)
    DB[:geeks].insert(name: 'Bob', stack: 'Front end', resume: true)
    DB[:geeks].insert(name: 'Kate', stack: 'PHP', resume: false)
    DB[:geeks].insert(name: 'Boris', stack: 'Full stack', resume: true)

    DB[:jobs].insert(name: 'Sinatra React', place: 'Remote', company_id: 1)
    DB[:jobs].insert(name: 'Ruby React', place: 'Contract', company_id: 2)
    DB[:jobs].insert(name: 'React', place: 'Remote', company_id: 3)
    DB[:jobs].insert(name: 'Node React', place: 'Permanent', company_id: 1)
    DB[:jobs].insert(name: 'Ruby on Rails', place: 'Remote', company_id: 4)
    DB[:jobs].insert(name: 'Node', place: 'Permanent', company_id: 4)
    DB[:jobs].insert(name: 'Javascript CSS HTML', place: 'Permanent', company_id: 4)

    DB[:companies].insert(name:'MoGo', location: 'New York')
    DB[:companies].insert(name: 'Wirkkle', location: 'London')
    DB[:companies].insert(name:'Artesis', location: 'Saint-Petersburg')
    DB[:companies].insert(name:'BuildEmpire', location: 'London')

  end
end