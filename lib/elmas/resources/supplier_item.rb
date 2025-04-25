# frozen_string_literal: true

module Elmas
  # Endpoint
  # SupplierItem
  #
  # Good to know
  # Use this endpoint to :  Link a supplier to a particular item and create an active item purchase price.
  #  It will default item start date as
  #  purchase price start date.
  #   Retrieve details of the linkage such as the purchase price, delivery terms, transport data, and the general details
  # between the item and the linked supplier.
  #  It only returns an active or future price.
  # 
  # Filter by StartDate and EndDate is not supported.
  #   Update the details of the linkage between the item and the linked supplier.
  #   Delete a linked supplier from the particular item.
  # Main supplier will be automatically defaulted to the first supplier linked to an item; however it can be changed 
  # when another supplier is linked and defined as the main supplier.
  #  A linked supplier cannot be removed from an item 
  # if the item has been used in a purchase order or when the item has been linked to the particular supplier in a 
  # purchase price list.
  # For more information about the suppliers by item functionality in Exact Online, see Overview | Suppliers by item
  #
  # Scope
  # Logistics items
  class SupplierItem
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "logistics/SupplierItem"
    end

    def mandatory_attributes
      %i[
        item item_unit purchase_price purchase_unit supplier
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=LogisticsSupplierItem
    def other_attributes
      %i[
        barcode copy_remarks country_of_origin country_of_origin_description created creator
        creator_full_name currency currency_description division drop_shipment end_date item_code
        item_description item_unit_code item_unit_description main_supplier minimum_quantity
        modified modifier modifier_full_name notes purchase_lead_time purchase_lot_size
        purchase_unit_description purchase_unit_factor purchase_vat_code
        purchase_vat_code_description start_date supplier_code supplier_description
        supplier_item_code
      ]
    end
  end
end
