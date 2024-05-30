# The name of this view in Looker is "Integration Hub"
view: integration_hub {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.integration_hub ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Definition JSON" in Explore.

  dimension: definition_json {
    type: string
    sql: ${TABLE}.definition_json ;;
  }

  dimension: encrypted_params {
    type: string
    sql: ${TABLE}.encrypted_params ;;
  }

  dimension: fetch_error_message {
    type: string
    sql: ${TABLE}.fetch_error_message ;;
  }

  dimension_group: fetched {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.fetched_at ;;
  }

  dimension_group: legal_agreement_acceptance {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.legal_agreement_acceptance_date ;;
  }

  dimension: legal_agreement_accepting_user_id {
    type: number
    sql: ${TABLE}.legal_agreement_accepting_user_id ;;
  }

  dimension: looker_hosted {
    type: yesno
    sql: ${TABLE}.looker_hosted ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
