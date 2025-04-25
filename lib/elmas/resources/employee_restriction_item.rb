# frozen_string_literal: true

module Elmas
  # Endpoint
  # EmployeeRestrictionItem
  #
  # Good to know
  # Use this endpoint to create, read, update and delete employee restriction items, it restricts hour types that can be used in time entries for the employee.
  # .
  # Note: For creating an employee restriction item, it is mandatory to supply employee and item.
  #  The supplied item needs to be a time unit item
  #
  # Scope
  # Projects projects
  class EmployeeRestrictionItem
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "project/EmployeeRestrictionItems"
    end

    def mandatory_attributes
      %i[
        employee item
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectEmployeeRestrictionItems
    def other_attributes
      %i[
        created creator creator_full_name division employee_full_name employee_hid item_code
        item_description item_is_time modified modifier modifier_full_name
      ]
    end
  end
end
