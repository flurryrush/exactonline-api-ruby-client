# frozen_string_literal: true

module Elmas
  # Endpoint
  # VariableMutation
  #
  # Good to know
  # Use this endpoint to :  Create a new variable mutation entry.
  #  It is mandatory to provide the value for PayrollYear, PayrollPeriod, EmployeeHID, and Type.
  # If the Type is payroll component, then PayrollComponent property is also mandatory.
  #   Get the details of variable mutation entry.
  #  Filters can be used to reduce the amount of data retrieved.
  #   Update a variable mutation entry.
  #  It is mandatory to provide the ID of the entry to update.
  # Note: To access the API using OAuth 2.
  # 0 authentication process, see Using OAuth 2.
  # 0 to access Exact Online API.
  #  You can find examples for setting up each API request in Make the request - REST For more information about the  functionality in Exact Online, see Payroll through variable mutations
  #
  # Scope
  # Hrm payroll
  class VariableMutation
    include Elmas::Resource

    def valid_actions
      %i[get post put]
    end

    def base_path
      "payroll/VariableMutations"
    end

    def mandatory_attributes
      %i[
        employee_hid payroll_period payroll_year type value
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PayrollVariableMutations
    def other_attributes
      %i[
        description employee_id entry_field_type notes payroll_component payroll_component_id
      ]
    end
  end
end
