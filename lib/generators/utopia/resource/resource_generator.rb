#--
# Copyright (C) 2012 Emerson Vinicius Moreira de Almeida

# This file is part of Utopia source code.

# Utopia source code is free software; you can redistribute it
# and/or modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of the License,
# or (at your option) any later version.

# Utopia source code is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Foobar; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#
#++

module Utopia
  class ResourceGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../../templates', __FILE__)

    def create_initializer_file
      template "resource.rb",  "app/resource/#{file_path.gsub('/', '_')}.rb"
    end
  end
end