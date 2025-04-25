# frozen_string_literal: true

module Elmas
  # Endpoint
  # PlannedSalesReturn
  #
  # Good to know
  # Use this endpoint to :  Create a new planned sales return.
  #   Retrieve an existing planned sales return.
  #   Update the draft planned sales return's description and planned return date  Delete a draft planned sales return.
  # A planned sales return allows a more efficient handling of legitimate returns from your customer.
  # For more information about the planned sales return functionality in Exact Online, see Sales Return
  #
  # Scope
  # Sales orders
  class PlannedSalesReturn
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "salesorder/PlannedSalesReturns"
    end

    def mandatory_attributes
      %i[
        delivered_to planned_sales_return_lines warehouse
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesOrderPlannedSalesReturns
    def other_attributes
      %i[
        planned_sales_return_id created creator creator_full_name delivered_to_contact_person
        delivered_to_contact_person_full_name delivered_to_name delivery_address description
        division document document_subject modified modifier modifier_full_name remarks return_date
        return_number source status warehouse_code warehouse_description
      ]
    end
  end
end
