# frozen_string_literal: true

module Elmas
  # Endpoint
  # BulkSalesOrderGoodsDelivery
  #
  # Good to know
  # This bulk service has a page size of 1000.
  # 
  # It is mandatory to provide the $select query option with a selection of one or more of the resource properties.
  # 
  # Only the following filters are supported for this endpoint:
  # Document, EntryID, Warehouse
  # 
  #
  # Scope
  # Logistics wms
  class BulkSalesOrderGoodsDelivery
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "bulk/SalesOrder/GoodsDeliveries"
    end

    def mandatory_attributes
      %i[
        delivery_date goods_delivery_lines
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=BulkSalesOrderGoodsDeliveries
    def other_attributes
      %i[
        entry_id created creator creator_full_name delivery_account delivery_account_code
        delivery_account_name delivery_address delivery_contact delivery_contact_person_full_name
        delivery_number description division document document_subject entry_number modified
        modifier modifier_full_name remarks shipping_method shipping_method_code
        shipping_method_description tracking_number warehouse warehouse_code warehouse_description
      ]
    end
  end
end
