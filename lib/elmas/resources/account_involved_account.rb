# frozen_string_literal: true

module Elmas
  # Endpoint
  # AccountInvolvedAccount
  #
  # Good to know
  # This resource will show all accounts which are involved for a specific account and will also show the type of the relation between the accounts.
  #  This functionality is only available in a practice management company
  #
  # Scope
  # Accountancy practicemanagement
  class AccountInvolvedAccount
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "accountancy/AccountInvolvedAccounts"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=AccountancyAccountInvolvedAccounts
    def other_attributes
      %i[
        account account_name created creator creator_full_name division involved_account
        involved_account_relation_type_description
        involved_account_relation_type_description_term_id involved_account_relation_type_id
        modified modifier modifier_full_name notes
      ]
    end
  end
end
