# frozen_string_literal: true

module Elmas
  # Endpoint
  # BankAccount
  #
  # Good to know
  # 
  #
  # Scope
  # Crm accounts
  class BankAccount
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "crm/BankAccounts"
    end

    def mandatory_attributes
      %i[
        account bank_account
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMBankAccounts
    def other_attributes
      %i[
        account_name bank bank_account_holder_name bank_description bank_name bic_code blocked
        created creator creator_full_name description division format iban main modified modifier
        modifier_full_name payment_service_account type type_description
      ]
    end
  end
end
