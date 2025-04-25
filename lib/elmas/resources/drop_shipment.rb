# frozen_string_literal: true

module Elmas
  # Endpoint
  # DropShipment
  #
  # Good to know
  # Use this endpoint to :  Create new drop shipments.
  #   Read existing drop shipments.
  #   Update existing drop shipments.
  # Delivery lines support trade-in lines.
  #  For more details, please refer description under properties DropShipmentLines > QuantityDelivered Note: For creating a DropShipments, it is mandatory to supply one or more DropShipmentLines and DeliveryDate.
  # For more information about the  functionality in Exact Online, see Drop Shipment - New
  #
  # Scope
  # Logistics wms
  class DropShipment
    include Elmas::Resource

    def valid_actions
      %i[get post put]
    end

    def base_path
      "salesorder/DropShipments"
    end

    def mandatory_attributes
      %i[
        delivery_date drop_shipment_lines
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesOrderDropShipments
    def other_attributes
      %i[
        entry_id created creator creator_full_name delivery_account delivery_account_code
        delivery_account_name delivery_address delivery_contact delivery_contact_person_full_name
        delivery_number description division document document_subject entry_number modified
        modifier modifier_full_name remarks shipping_method shipping_method_code
        shipping_method_description tracking_number
      ]
    end
  end
end
