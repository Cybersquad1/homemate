##
# Copyright (c) Andrew Ying 2017.
#
# This file is part of HomeMate.
#
# HomeMate is free software: you can redistribute it and/or modify
# it under the terms of version 3 of the GNU General Public License
# as published by the Free Software Foundation. You must preserve
# all reasonable legal notices and author attributions in this program
# and in the Appropriate Legal Notice displayed by works containing
# this program.
#
# HomeMate is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with HomeMate.  If not, see <http://www.gnu.org/licenses/>.
##

require 'openssl'
require 'gocardless_pro'

class BillingController < ActionController::API
  def create
    secret = Setting.gocardless.webhook_secret

    computed_signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), secret, request.raw_post)
    provided_signature = request.headers['Webhook-Signature']

    unless Rack::Utils.secure_compare(provided_signature, computed_signature)
      render status: 498
    end

    params['events'].each do |event|
      case event['resource_type']
        when 'mandates'
          ProcessMandateEvent.perform_later(event)
        when 'payments'
          ProcessPaymentEvent.perform_later(event)
        else
          logger.info 'Unable to handle resource type ' + event['resource_type']
      end
    end
  end
end