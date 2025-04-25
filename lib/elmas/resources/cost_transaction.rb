# frozen_string_literal: true

module Elmas
  # Endpoint
  # CostTransaction
  #
  # Good to know
  # Use this endpoint to create, read, update and delete cost transaction of the user.
  # Note: For creating a cost transaction, it is mandatory to supply one of the following properties   • Account   • Project   • Subscription   And always supply   • Item   • Quantity
  #
  # Scope
  # Projects projects
  class CostTransaction
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "project/CostTransactions"
    end

    def mandatory_attributes
      %i[
        item quantity
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectCostTransactions
    def other_attributes
      %i[
        account account_name amount amount_fc attachment created creator creator_full_name
        currency custom_field date division division_description employee entry_number error_text
        expense expense_description hour_status item_description item_divisable modified modifier
        modifier_full_name notes price price_fc project project_account project_account_code
        project_account_name project_description skip_validation subscription subscription_account
        subscription_account_code subscription_account_name subscription_description
        subscription_number type
      ]
    end
  end
end
