# frozen_string_literal: true

module Elmas
  # Endpoint
  # HostingOpportunity
  #
  # Good to know
  # 
  #
  # Scope
  # Hosting hosting
  class HostingOpportunity
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "crm/HostingOpportunities"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMHostingOpportunities
    def other_attributes
      %i[
        account accountant accountant_code accountant_name account_code account_name action_date
        amount_dc amount_fc back_to_lead_development campaign campaign_description channel
        channel_description close_date created creator creator_full_name currency
        customer_demands_description decision_making_unit_name decision_making_unit_role
        decision_timeframe dispatch_to_sales division is_associated_price is_customer_demands_meet
        lead_developer lead_source lead_source_description modified modifier modifier_full_name
        name next_action notes number opportunity_department_code
        opportunity_department_description opportunity_stage opportunity_stage_description
        opportunity_status opportunity_type opportunity_type_description owner owner_full_name
        probability project project_code project_description rate_fc reason_back reason_code
        reason_code_description reseller reseller_code reseller_name sales_type
        sales_type_description
      ]
    end
  end
end
