# encoding: utf-8
#
#    Easy way to open data
#    Copyright (C) 2013 Duke<duke@riseup.net>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'utopia_data/version'
require 'forwardable'

# UtopiaData
# @todo: documentation
module UtopiaData
  autoload :Api,          'utopia_data/api'
  autoload :Application,  'utopia_data/application'
  autoload :Resource,     'utopia_data/resource'
  autoload :Route,        'utopia_data/route'

  class << self
    extend Forwardable

    # the application intance
    def application
      @application ||= ::UtopiaData::Application.new
    end

    # register a new resource
    def_delegator :application, :register, :register
  #  def_delegator :application, :setup, :setup
  end
end
