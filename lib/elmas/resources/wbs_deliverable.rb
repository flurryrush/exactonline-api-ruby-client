# frozen_string_literal: true

module Elmas
  # Endpoint
  # WBSDeliverable
  #
  # Good to know
  # Use this endpoint to create, read, update and delete Work Breakdown Structure (WBS) deliverable.
  # Note: For creating a WBS deliverable, it is mandatory to supply Project and Description
  #
  # Scope
  # Projects projects
  class WBSDeliverable
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "project/WBSDeliverables"
    end

    def mandatory_attributes
      %i[
        description project
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectWBSDeliverables
    def other_attributes
      %i[
        completed created creator creator_full_name custom_field division milestone modified
        modifier modifier_full_name notes part_of part_of_description project_description
        project_term project_term_description release_invoice_term release_invoice_term_date
        release_invoice_term_has_specify_date sequence_number type update_action
      ]
    end
  end
end
