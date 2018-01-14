require 'rubygems'
require 'bundler'
require 'require_all'

project_root = File.dirname(__FILE__) + '/..'
$LOAD_PATH << "#{project_root}/app"

require "#{project_root}/app/project_root"
require_all "#{Monkeyking.project_root}/app"
