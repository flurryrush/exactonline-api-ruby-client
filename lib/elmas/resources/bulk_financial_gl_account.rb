# frozen_string_literal: true

module Elmas
  # Endpoint
  # BulkFinancialGLAccount
  #
  # Good to know
  # Use this endpoint to retrieve a large number of G/L accounts.
  #  To view more information or maintain individual G/L accounts you can use the following end point Exact Online REST API - GLAccounts.
  # This bulk service has a page size of 1000.
  #
  # It is mandatory to provide the $select query option with a selection of one or more of the resource properties.
  #
  # Only the following filters are supported for this endpoint:
  # AssimilatedVATBox, BelcotaxType, Code, Costcenter, Costunit, Created, Creator, ID, Modified, Modifier, PrivateGLAccount, SearchCode, Type, VATNonDeductibleGLAccount, YearEndCostGLAccount, YearEndReflectionGLAccount
  #
  #
  # Scope
  # Financial generalledgers
  class BulkFinancialGLAccount
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "bulk/Financial/GLAccounts"
    end

    def mandatory_attributes
      %i[
        code description
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=BulkFinancialGLAccounts
    def other_attributes
      %i[
        allow_costs_in_sales assimilated_vat_box balance_side balance_type belcotax_type compress
        costcenter costcenter_description costunit costunit_description created creator
        creator_full_name custom_field deductibility_percentages description_term_id division
        exclude_vat_listing expense_non_deductible_percentage is_blocked matching modified modifier
        modifier_full_name private_gl_account private_percentage reporting_code revalue_currency
        search_code type type_description use_costcenter use_costunit vat_code vat_description
        vat_gl_account_type vat_non_deductible_gl_account vat_non_deductible_percentage vat_system
        year_end_cost_gl_account year_end_reflection_gl_account
      ]
    end
  end
end
