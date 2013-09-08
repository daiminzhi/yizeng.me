require 'rake/testtask'

task :default => [:test]
Rake::TestTask.new(:test) do |test|
    test.libs << 'test'
    test.test_files = FileList['test/test_*/test_*.rb']
    test.verbose = true
end