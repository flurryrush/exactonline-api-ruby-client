# frozen_string_literal: true

module Elmas
  # Endpoint
  # CustomField
  #
  # Good to know
  # This endpoint can be reached from the other main entity endpoints as below and more: CRM/AccountsCRM/ContactsCRM/OpportunityContactsCRM/OpportunitiesCRM/AddressesCRM/QuotationLinesInventory/BatchNumbersInventory/SerialNumbersLogistics/ItemsPayroll/EmployeesProject/ProjectPurchase/PurchaseInvoiceLinesPurchaseOrder/PurchaseOrderLinesSalesInvoice/SalesInvoiceLinesSalesOrder/SalesOrdersSalesOrder/SalesOrderLinesSync/PurchaseOrder/PurchaseOrderSync/SalesInvoice/SalesInvoicesSync/SalesOrder/SalesOrderHeadersSync/SalesOrder/SalesOrderLinesSync/CRM/QuotationLinesBulk/SalesOrder/SalesOrdersBulk/SalesOrder/SalesOrderLinesBulk/SalesInvoice/SalesInvoicesBulk/CRM/QuotationLines'CustomField' property of the above entities contains the full URI of this endpoint including two mandatory query parameters, LinkId and BcName.
  # The response contains all custom fields associated with the given LinkId of the main entity.
  # Also 'CustomField' property can be defined as GUID (reference/browsable) fields in which case it will function as a reference to the existing entities.
  # For this function to work correctly, you must supply all parameters
  #
  # Scope
  # Organization extensibility
  class CustomField
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "customfield/CustomFields"
    end

    def mandatory_attributes
      %i[
        link_id business_component_name property_name value
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CustomFieldCustomFields
    def other_attributes
      %i[
        caption refers_to type
      ]
    end
  end
end
