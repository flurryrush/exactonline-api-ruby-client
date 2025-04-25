# frozen_string_literal: true

module Elmas
  # Endpoint
  # AccountOwner
  #
  # Good to know
  # The account owners are accounts which represents the owners or shareholders for a specific account.
  #  In this resource also the percentage of shares which the account holds are stored.
  #  This functionality is only available in a practice management company
  #
  # Scope
  # Accountancy practicemanagement
  class AccountOwner
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "accountancy/AccountOwners"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=AccountancyAccountOwners
    def other_attributes
      %i[
        account account_code account_name created creator creator_full_name division modified
        modifier modifier_full_name owner_account owner_account_code owner_account_name shares
      ]
    end
  end
end
