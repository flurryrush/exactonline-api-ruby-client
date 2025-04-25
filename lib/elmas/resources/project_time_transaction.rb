# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProjectTimeTransaction
  #
  # Good to know
  # Use this endpoint to create, read, update and delete time transaction of the user.
  # Note: For creating a time transaction, it is mandatory to supply one of the following properties   • Account   • Project   • Subscription   And always supply   • Item   • Quantity
  #
  # Scope
  # Projects billing
  class ProjectTimeTransaction
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "project/TimeTransactions"
    end

    def mandatory_attributes
      %i[
        item quantity
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectTimeTransactions
    def other_attributes
      %i[
        account account_name activity activity_description amount amount_fc attachment created
        creator creator_full_name currency custom_field date division division_description employee
        end_time entry_number error_text hour_status item_description item_divisable modified
        modifier modifier_full_name notes price price_fc project project_account
        project_account_code project_account_name project_code project_description skip_validation
        start_time subscription subscription_account subscription_account_code
        subscription_account_name subscription_description subscription_number type
      ]
    end
  end
end
