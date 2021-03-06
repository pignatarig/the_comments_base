_root_ = File.expand_path('../../',  __FILE__)

require "the_comments_base/version"
require "the_comments_base/config"

require 'jbuilder'
require 'the_notification'
require 'the_sortable_tree'
require 'awesome_nested_set'

require 'slim'
require 'the_data_role_block_slim'
require 'the_data_role_block_jquery'

require 'aasm'

module TheCommentsBase
  class Engine < Rails::Engine
    # http://stackoverflow.com/questions/24244519
    #
    # 1. Removing all the require / require_relative
    # 2. Add needed paths to Rails autoload paths
    # 3. Put files at the right places with the right names so Rails can infer where to look for code to load.
    # config.autoload_paths << "#{ config.root }/app/models/concerns/the_comments/**"
    # config.autoload_paths << "#{ config.root }/app/controllers/concerns/the_comments/**"
  end

  # simple and almost perfect
  # anything[at]anything[dot]anything{2-15}
  EMAIL_REGEXP = /\A(\S+)@(\S+)\.(\S{2,15})\z/

  # "  hello @ world .com  " => "hello@world.com"
  def self.normalize_email str
    str.to_s.squish.strip.gsub(/\s*/, '')
  end
end

# Routing cocerns loading
require "#{ _root_ }/config/routes"
