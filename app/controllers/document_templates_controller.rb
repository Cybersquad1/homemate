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

class DocumentTemplatesController < ApplicationController
  before_action :authenticate_user!, :require_landlord

  def index
    @templates = DocumentTemplate.all
  end

  def show
    @template = DocumentTemplate.find(params[:id])
  end

  def new
    @template = DocumentTemplate.new
  end

  def create
    @template = DocumentTemplate.new
  end

  def variables
  end

  private

  def template_params
    params.require(:template).permit([:document_to_attach, :variables])
  end
end