# frozen_string_literal: true

module Elmas
  # Endpoint
  # BulkProjectProjectWB
  #
  # Good to know
  # The results are not ordered by WBS sequence
  # This bulk service has a page size of 1000.
  # 
  # It is mandatory to provide the $select query option with a selection of one or more of the resource properties.
  # 
  # Only the following filters are supported for this endpoint:
  # DefaultItem, ID, Modified, Parent, Project, ProjectTerm, Type
  # 
  # 
  #
  # Scope
  # Projects projects
  class BulkProjectProjectWB
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "bulk/Project/ProjectWBS"
    end

    def mandatory_attributes
      %i[
        description
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=BulkProjectProjectWBS
    def other_attributes
      %i[
        additional_invoicing baseline_date block_entry block_rebilling budget_overrun_hours
        completed cost created creator custom_field default_item default_item_is_mandatory division
        end_date hours invoice_method is_baseline milestone modified modifier notes parent project
        project_term purchase_markup_percentage purchase_price quantity revenue sequence_number
        start_date supplier time_quantity_to_alert type
      ]
    end
  end
end
