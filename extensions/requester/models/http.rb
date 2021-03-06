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
module BeEF
module Core
module Models
  #
  # Table stores the http requests and responses from the requester.
  #
  class Http
  
    include DataMapper::Resource
    
    storage_names[:default] = 'extension_requester_http'
    
    property :id, Serial

    # The hooked browser id
    property :hooked_browser_id, Text, :lazy => false

    # The http request to perform. In clear text.
    property :request, Text, :lazy => true

    # The http response body received. In clear text.
    property :response_data, Text, :lazy => true

    # The http response code. Useful to handle cases like 404, 500, 302, ...
    property :response_status_code, Integer, :lazy => true

    # The http response code. Human-readable code: success, error, ecc..
    property :response_status_text, Text, :lazy => true

    # The XHR Http response raw headers
    property :response_headers, Text, :lazy => true

    # The http response method. GET or POST.
    property :method, Text, :lazy => false

    # The content length for the request.
    property :content_length, Text, :lazy => false, :default => 0

    # The domain on which perform the request.
    property :domain, Text, :lazy => false

    # Boolean value to say if the request was cross-domain
    property :has_ran, Boolean, :default => false

    # The path of the request.
    # Example: /secret.html
    property :path, Text, :lazy => false

    # The date at which the http response has been saved.
    property :response_date, DateTime, :lazy => false

    # The date at which the http request has been saved.
    property :request_date, DateTime, :lazy => false

    # Boolean value to say if the http response has been received or not.
    property :has_ran, Boolean, :default => false
    
  end
  
end
end
end
