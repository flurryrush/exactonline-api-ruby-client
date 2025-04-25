# frozen_string_literal: true

module Elmas
  # Endpoint
  # InvoiceTerm
  #
  # Good to know
  # Use this endpoint to create, read, update and delete invoice terms for Fixed price/Prepaid project.
  # Invoice terms are agreed-upon amounts that must be paid by certain dates.
  #  Invoice terms can be created for Fixed price and Prepaid projects.
  # Note: For creating invoice term, it is mandatory to supply Project Id and Amount
  #
  # Scope
  # Projects projects
  class InvoiceTerm
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "project/InvoiceTerms"
    end

    def mandatory_attributes
      %i[
        amount project
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectInvoiceTerms
    def other_attributes
      %i[
        created creator creator_full_name deliverable description division execution_from_date
        execution_to_date invoice_date invoice_id invoice_status item item_description modified
        modifier modifier_full_name notes percentage project_description vat_code
        vat_code_description vat_percentage wbs
      ]
    end
  end
end
