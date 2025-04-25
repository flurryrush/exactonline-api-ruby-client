# frozen_string_literal: true

module Elmas
  # Endpoint
  # ProjectWBSByProjectAndWB
  #
  # Good to know
  # This endpoint enables users to retrieve Work Breakdown Structure (WBS) line information based on the project ID  And WBS ID provided.
  # For this function to work correctly, you must supply all parameters
  #
  # Scope
  # Projects projects
  class ProjectWBSByProjectAndWB
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/project/ProjectWBSByProjectAndWBS"
    end

    def mandatory_attributes
      %i[
        description
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadProjectProjectWBSByProjectAndWBS
    def other_attributes
      %i[
        additional_invoicing baseline_date block_entry block_rebilling budget_overrun_hours
        completed cost created creator custom_field default_item default_item_is_mandatory division
        end_date hours invoice_method is_baseline milestone modified modifier notes parent project
        project_term purchase_markup_percentage purchase_price quantity revenue start_date supplier
        time_quantity_to_alert type
      ]
    end
  end
end
