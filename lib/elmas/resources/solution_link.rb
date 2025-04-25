# frozen_string_literal: true

module Elmas
  # Endpoint
  # SolutionLink
  #
  # Good to know
  # Solution links are used to store which bookkeeping solution is used for a certain account.
  #  This can be the bookkeeping solution of Exact Online which is mentioned as âinternalâ or a bookkeeping solution of another vender which is mentioned as âexternalâ
  #
  # Scope
  # Accountancy practicemanagement
  class SolutionLink
    include Elmas::Resource

    def valid_actions
      %i[get post put delete]
    end

    def base_path
      "accountancy/SolutionLinks"
    end

    def mandatory_attributes
      %i[
        account solution_type
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=AccountancySolutionLinks
    def other_attributes
      %i[
        created creator division external_solution_code external_solution_name
        external_solution_url internal_solution_division modified modifier name
        other_external_solution_name status
      ]
    end
  end
end
