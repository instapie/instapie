# Parse the .env file and inject it into ENV
File.new('.env').each_line do |line|
  key, value = line.strip.split('=', 2)
  Object.const_set(key, value)
end

namespace :dev do
  namespace :server do
    desc 'Start the HTTP server in development'
    task :http do
      sh "SESSION_SECRET=#{SESSION_SECRET} rails server -p 3000 -P tmp/pids/server.pid"
    end

    desc 'Start the HTTPS server in development'
    task :https do
      sh "SESSION_SECRET=#{SESSION_SECRET} rails server -p 8000 -P tmp/pids/https-server.pid"
    end
  end

  task :server => 'server:http'
end
