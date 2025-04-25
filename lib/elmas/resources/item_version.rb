# frozen_string_literal: true

module Elmas
  # Endpoint
  # ItemVersion
  #
  # Good to know
  # This endpoint is obsolete.
  #  Refer to the BillOfMaterialVersions endpoint under Manufacturing
  #
  # Scope
  # Logistics items
  class ItemVersion
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "logistics/ItemVersions"
    end

    def mandatory_attributes
      %i[
        description item
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=LogisticsItemVersions
    def other_attributes
      %i[
        batch_quantity calculated_cost_price created creator creator_full_name division is_default
        item_description lead_time modified modifier modifier_full_name notes status
        status_description type type_description version_date version_number
      ]
    end
  end
end
