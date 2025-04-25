# frozen_string_literal: true

module Elmas
  # Endpoint
  # UpdateCustomField
  #
  # Good to know
  # This endpoint supports the modification of the CustomFields.
  # The POST payload can only contain one custom field name-value pair.
  # Therefore, updating multiple numbers of custom fields of one entity requires the same numbers of POST calls.
  # When a 'CustomField' is defined as a GUID field and in order to update the value of the 'CustomField', an additional GET call to the referenced entity is needed to get the data of that referenced entity
  #
  # Scope
  # Organization extensibility
  class UpdateCustomField
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "customfield/UpdateCustomField"
    end

    def mandatory_attributes
      %i[
        link_id business_component_name property_name value
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CustomFieldUpdateCustomField
    def other_attributes
      %i[
        caption refers_to type
      ]
    end
  end
end
