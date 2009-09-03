require File.dirname(__FILE__) + '/../config/environment'
require 'application'

ApplicationController.logger.info "start:#{Time.now}"

Twitter::Status::Friend.find(:all)

ApplicationController.logger.info "end:#{Time.now}"

