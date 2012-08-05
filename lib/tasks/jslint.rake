begin
  require 'jslint/testtask'

  JSLint::TestTask.new do |t|
    t.file_list = Dir['{app,lib}/assets/javascripts/**/*.js']
    t.options = {
      :browser => true,
      :nomen => true,
      :predef => ['$', 'prettyPrint'],
      :sloppy => true
    }
  end

  Rake::Task[:spec].enhance(['jslint'])
rescue LoadError
  # JSLint not loaded (eg, in production). Oh well.
end
