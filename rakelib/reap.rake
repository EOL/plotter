require 'resource'

namespace :reap do
  desc 'a b c'
  task :reap do 
    resource = Resource.new(ENV['WORKSPACE_ROOT'])
    resource.bind_to_opendata(ENV['URL'])
    resource.bind_to_publishing(ENV['PUBLISH'], ENV['ID'])
    resource.bind_to_repository(ENV['REPOSITORY'], ENV['REPOSITORY_ID'])
    resource.harvest
  end

  task :vernaculars do
    resource = Resource.new(ENV['WORKSPACE_ROOT'])
    resource.bind_to_publishing(ENV['PUBLISH'], ENV['ID'])
    resource.bind_to_stage(ENV['STAGE_SCP_LOCATION'],
                           ENV['STAGE_WEB_LOCATION'])
    resource.publish_vernaculars
  end
end
