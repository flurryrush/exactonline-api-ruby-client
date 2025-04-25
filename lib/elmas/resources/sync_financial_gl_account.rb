# frozen_string_literal: true

module Elmas
  # Endpoint
  # SyncFinancialGLAccount
  #
  # Good to know
  # The sync api's have the goal to keep the data between Exact Online and a 3rd party application the same.
  #
  # The sync api's are all based on row versioning and because of that it is guaranteed to be unique.
  #  Every time an existing record is changed or a new record is inserted, the row versioning value is higher than the highest available value at that time.
  #  When retrieving records via these api's also a timestamp value is returned.
  #  The highest timestamp value of the records returned should be stored on client side.
  #  Next time records are retrieved, the timestamp value stored on client side should be provided as parameter.
  #  The api will then return only the new and changed records.
  #  Using this method is more reliable than using modified date, since it can happen that multiple records have the same modified date and therefore same record can be returned more than once.
  #  This will not happen when using timestamp.
  #
  # The sync api's are also developed to give best performance when retrieving records.
  #  Because of performance and the intended purpose of the api's, only the timestamp field is allowed as parameter.
  #
  # The single and bulk apiâs are designed for a different purpose.
  #  They provide ability to retrieve specific record or a set of records which meet certain conditions.
  #
  # In case the division is moved to another database in Exact Online the timestamp values will be reset.
  #  Therefore, after a division is moved all data needs to be synchronized again in order to get the new timestamp values.
  #  To see if a division was moved, the /api/v1/{division}/system/Divisions can be used.
  #  The property DivisionMoveDate indicated at which date a division was moved and this date can be used to determine if it is needed to synchronize all data again.
  #
  # The API has two important key fields, the Timestamp and the ID.
  #  The ID should be used to uniquely identify the record and will never change
  # .
  #  The Timestamp is used to get new or changed records in an efficient way and will change for every change made to the record.
  #
  # The timestamp value returned has no relation with actual date or time.
  #  As such it cannot be converted to a date\time value.
  #  The timestamp is a rowversion value.
  #
  # When you use the sync or delete api for the first time for a particular division, filter on timestamp greater than 1.
  #
  #
  #
  # Scope
  # Financial generalledgers
  class SyncFinancialGLAccount
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "sync/Financial/GLAccounts"
    end

    def mandatory_attributes
      %i[
        code description
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SyncFinancialGLAccounts
    def other_attributes
      %i[
        timestamp allow_costs_in_sales assimilated_vat_box balance_side balance_type belcotax_type
        compress costcenter costcenter_description costunit costunit_description created creator
        creator_full_name custom_field description_term_id division exclude_vat_listing
        expense_non_deductible_percentage is_blocked matching modified modifier modifier_full_name
        private_gl_account private_percentage reporting_code revalue_currency search_code type
        type_description use_costcenter use_costunit vat_code vat_description vat_gl_account_type
        vat_non_deductible_gl_account vat_non_deductible_percentage vat_system
        year_end_cost_gl_account year_end_reflection_gl_account
      ]
    end
  end
end
