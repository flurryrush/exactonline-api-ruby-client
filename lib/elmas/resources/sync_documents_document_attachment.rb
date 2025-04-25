# frozen_string_literal: true

module Elmas
  # Endpoint
  # SyncDocumentsDocumentAttachment
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
  # Organization documents
  class SyncDocumentsDocumentAttachment
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "sync/Documents/DocumentAttachments"
    end

    def mandatory_attributes
      %i[
        attachment document file_name
      ]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SyncDocumentsDocumentAttachments
    def other_attributes
      %i[
        timestamp file_size url
      ]
    end
  end
end
