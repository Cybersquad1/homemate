##
# Copyright (c) Andrew Ying 2017-18.
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

class UserMailer < Devise::Mailer
  layout 'mailer'
  helper :application
  include Devise::Controllers::UrlHelpers

  default template_path: 'user_mailer'
  default from: 'no-reply@homemate.local'

  # Send the initial password upon account creation.
  #
  # @param [User] user The newly created user
  # @param [string] password Automatically generated password
  #
  # @return void
  def account_created(user, password)
    @user = user
    @password = password

    mail(
        to: %("#{@user.contact.name}" <#{@user.email}>),
        subject: 'Welcome to HomeMate'
    )
  end
end
