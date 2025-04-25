# frozen_string_literal: true

module Elmas
  # Endpoint
  # SyncSalesInvoiceSalesInvoice
  #
  # Good to know
  # Any change in the header or the line of the SalesInvoices will lead to a new timestamp value in both the header and the line.
  #  The API will return both header and line data in the same API call, to determine if the record is the header or the line, the line number can be used.
  #  If the line number is 0 it is the sales invoice header, if the line number is 1 or higher it is a sales invoice line.
  # 
  # The sync api's have the goal to keep the data between Exact Online and a 3rd party application the same.
  # 
  # The sync api's are all based on row versioning and because of that it is guaranteed to be unique.
  #  Every time an existing record is changed or a new record is inserted, the row versioning value is higher than the highest available value at that time.
  #  When retrieving records via these api's also a timestamp value is returned.
  #  The highest timestamp value of the records returned should be stored on client side.
  #  Next time records are retrieved, the timestamp value stored on client side should be provided as parameter.
  #  The api will then return only the new and changed records.
  #  Using this method is more reliable than using modified date, since it can happen that multiple records have the same modified date and therefore same record can be returned more than once.
  #  This will not happen when using timestamp.
  # 
  # The sync api's are also developed to give best performance when retrieving records.
  #  Because of performance and the intended purpose of the api's, only the timestamp field is allowed as parameter.
  # 
  # The single and bulk apiâs are designed for a different purpose.
  #  They provide ability to retrieve specific record or a set of records which meet certain conditions.
  # 
  # In case the division is moved to another database in Exact Online the timestamp values will be reset.
  #  Therefore, after a division is moved all data needs to be synchronized again in order to get the new timestamp values.
  #  To see if a division was moved, the /api/v1/{division}/system/Divisions can be used.
  #  The property DivisionMoveDate indicated at which date a division was moved and this date can be used to determine if it is needed to synchronize all data again.
  # 
  # The API has two important key fields, the Timestamp and the ID.
  #  The ID should be used to uniquely identify the record and will never change
  # .
  #  The Timestamp is used to get new or changed records in an efficient way and will change for every change made to the record.
  # 
  # The timestamp value returned has no relation with actual date or time.
  #  As such it cannot be converted to a date\time value.
  #  The timestamp is a rowversion value.
  # 
  # When you use the sync or delete api for the first time for a particular division, filter on timestamp greater than 1.
  # 
  # Or use the SyncTimestamp API to GET a timestamp from a certain date.
  # 
  # 
  #
  # Scope
  # Sales invoices
  class SyncSalesInvoiceSalesInvoice
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "sync/SalesInvoice/SalesInvoices"
    end

    def mandatory_attributes
      %i[
        gl_account invoice_id item journal ordered_by
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SyncSalesInvoiceSalesInvoices
    def other_attributes
      %i[
        timestamp amount_dc amount_discount amount_discount_excl_vat amount_fc amount_fc_excl_vat
        cost_center cost_center_description cost_unit cost_unit_description created creator
        creator_full_name currency customer_item_code custom_field deliver_to deliver_to_address
        deliver_to_contact_person deliver_to_contact_person_full_name deliver_to_name delivery_date
        description discount discount_type division document document_number document_subject
        due_date employee employee_full_name end_time extra_duty_amount_fc extra_duty_percentage
        g_account_amount_fc gl_account_description incoterm_address incoterm_code incoterm_version
        invoice_date invoice_number invoice_to invoice_to_contact_person
        invoice_to_contact_person_full_name invoice_to_name is_extra_duty item_code
        item_description journal_description line_number modified modifier modifier_full_name
        net_price notes order_date ordered_by_contact_person ordered_by_contact_person_full_name
        ordered_by_name order_number payment_condition payment_condition_description
        payment_reference pricelist pricelist_description project project_description project_wbs
        project_wbs_description quantity remarks sales_channel sales_channel_code
        sales_channel_description sales_order sales_order_line sales_order_line_number
        sales_order_number salesperson salesperson_full_name starter_sales_invoice_status
        starter_sales_invoice_status_description start_time status status_description subscription
        subscription_description tax_schedule tax_schedule_code tax_schedule_description type
        type_description unit_code unit_description unit_price vat_amount_dc vat_amount_fc vat_code
        vat_code_description vat_percentage warehouse withholding_tax_amount_fc
        withholding_tax_base_amount withholding_tax_percentage your_ref
      ]
    end
  end
end
