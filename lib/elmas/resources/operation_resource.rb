# frozen_string_literal: true

module Elmas
  # Endpoint
  # OperationResource
  #
  # Good to know
  # 
  #
  # Scope
  # Manufacturing production
  class OperationResource
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "manufacturing/OperationResources"
    end

    def mandatory_attributes
      %i[
        operation
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ManufacturingOperationResources
    def other_attributes
      %i[
        account attended_percentage created creator creator_full_name currency division
        efficiency_percentage is_primary modified modifier modifier_full_name operation_description
        purchase_lead_days purchase_unit purchase_vat_code run run_method setup setup_unit type
        workcenter workcenter_description
      ]
    end
  end
end
