# frozen_string_literal: true

module Elmas
  # Endpoint
  # EmploymentSalary
  #
  # Good to know
  # Use this endpoint to read employment salaries.
  # The employment salary contains the basic information about the employee's salary, like full and parttime salary, hourly wage and scale.
  # For more information about the employment salaries functionality in Exact Online, see Modify an employee's salary or rate
  #
  # Scope
  # Hrm payroll
  class EmploymentSalary
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "payroll/EmploymentSalaries"
    end

    def mandatory_attributes
      %i[
        
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=PayrollEmploymentSalaries
    def other_attributes
      %i[
        amount_type amount_type_description auto_correction average_days_per_week
        average_hours_per_week billability_target created creator creator_full_name description
        division employee employee_full_name employee_hid employment employment_hid
        employment_number employment_salary_type employment_salary_type_description end_date
        external_rate frequency frequency_description fulltime_amount hourly_wage intercompany_rate
        internal_rate job_level modified modifier modifier_full_name parttime_amount
        parttime_factor salary_based_type salary_based_type_description scale schedule
        schedule_code schedule_description start_date wage_scale wage_scale_period wage_scale_step
      ]
    end
  end
end
