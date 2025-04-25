# frozen_string_literal: true

module Elmas
  # Endpoint
  # ItemChargeRelation
  #
  # Good to know
  # Use this endpoint to read relationship between items and item charge codes.
  # Item charge codes are used to register items that require deposit (applicable for all legislations) 
  # or items that subjected to environmental tax (applicable for BE legislation only)For more information about the  functionality in Exact Online, see Manage item charges for deposit items
  #
  # Scope
  # Logistics items
  class ItemChargeRelation
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "logistics/ItemChargeRelation"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=LogisticsItemChargeRelation
    def other_attributes
      %i[
        amount charge_code charge_description charge_id charge_vat_code charge_vat_description
        charge_vat_percentage charge_vat_type created creator creator_full_name currency division
        item_code item_description item_id modified modifier modifier_full_name quantity
        total_amount
      ]
    end
  end
end
