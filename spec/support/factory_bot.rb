#FactoryBotがロードされる前にincludeするので、明示的にFactoryBotをロードするように記載。
require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
