# frozen_string_literal: true

module Elmas
  # Endpoint
  # PurchaseReturn
  #
  # Good to know
  # Use this endpoint to :  Create a new purchase return.
  #   Retrieve an existing purchase return.
  #   Update an existing purchase return.
  #  Note: For creating a PurchaseReturn, it is mandatory to supply one or more PurchaseReturnLines and ReturnDate
  #
  # Scope
  # Logistics wms
  class PurchaseReturn
    include Elmas::Resource

    def valid_actions
      %i[get post put]
    end

    def base_path
      "purchaseorder/PurchaseReturns"
    end

    def mandatory_attributes
      %i[
        purchase_return_lines return_date
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PurchaseOrderPurchaseReturns
    def other_attributes
      %i[
        created creator creator_full_name description division document modified modifier
        modifier_full_name remarks return_number status supplier supplier_address supplier_contact
        supplier_contact_full_name tracking_number warehouse warehouse_code warehouse_description
        your_ref
      ]
    end
  end
end
