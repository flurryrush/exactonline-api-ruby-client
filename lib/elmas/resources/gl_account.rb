# frozen_string_literal: true

module Elmas
  # Endpoint
  # GLAccount
  #
  # Good to know
  # Use this endpoint to retrieve information of all the G/L accounts of your administration.
  #  Aside from that you can also create, update or delete G/L account.
  # Add CustomDescriptionLanguage='[ NL | FR-BE | NL-BE | .
  # .
  # .
  #  ]' to the header to retrieve language sensitive properties such as descriptions in a specific language.
  # For more information about G/L accounts, you can visit the following help file Working with G/L accounts
  #
  # Scope
  # Financial generalledgers
  class GLAccount
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "financial/GLAccounts"
    end

    def mandatory_attributes
      %i[
        code description
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=FinancialGLAccounts
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
