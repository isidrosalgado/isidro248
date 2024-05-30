# The name of this view in Looker is "Proxy Verification Token"
view: proxy_verification_token {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.proxy_verification_token ;;
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
    # This dimension will be called "Encrypted Integration Access Token" in Explore.

  dimension: encrypted_integration_access_token {
    type: string
    sql: ${TABLE}.encrypted_integration_access_token ;;
  }

  dimension: encrypted_verification_token {
    type: string
    sql: ${TABLE}.encrypted_verification_token ;;
  }

  dimension: install_id {
    type: string
    sql: ${TABLE}.install_id ;;
  }

  dimension: install_name {
    type: string
    sql: ${TABLE}.install_name ;;
  }

  dimension: installation_type {
    type: string
    sql: ${TABLE}.installation_type ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }
  measure: count {
    type: count
    drill_fields: [id, install_name]
  }
}
