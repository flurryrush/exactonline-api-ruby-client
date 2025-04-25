# frozen_string_literal: true

module Elmas
  # Endpoint
  # SalesChannel
  #
  # Good to know
  # Use this endpoint to create, read, update and delete Sales Channels.
  # This endpoint allow you to manage the basic information of the sales channel
  #
  # Scope
  # Crm quotes sales orders sales invoices
  class SalesChannel
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "sales/SalesChannels"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesSalesChannels
    def other_attributes
      %i[
        active code created creator creator_full_name description division modified modifier
        modifier_full_name notes
      ]
    end
  end
end
