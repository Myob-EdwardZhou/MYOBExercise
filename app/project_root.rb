# frozen_string_literal: true

require 'pathname'

module Monkeyking
  def self.project_root
    @project_root ||= Pathname.new(File.expand_path('../../', __FILE__)).freeze
  end
end
