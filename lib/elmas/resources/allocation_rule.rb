# frozen_string_literal: true

module Elmas
  # Endpoint
  # AllocationRule
  #
  # Good to know
  # 
  #
  # Scope
  # Financial cashflow
  class AllocationRule
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "beta/{division}/cashflow/AllocationRule"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CashflowAllocationRule
    def other_attributes
      %i[
        account account_bank_account costcenter costunit created creator division gl_account
        modified modifier vat_code words
      ]
    end
  end
end
