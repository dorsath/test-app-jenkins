
desc 'Run spinach features'
task spinach: :environment do
  exec "spinach"
end


task :default => [:test, :spinach]

