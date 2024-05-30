# The name of this view in Looker is "Oauth Application"
view: oauth_application {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.oauth_application ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Auth Request Params" in Explore.

  dimension: auth_request_params {
    type: string
    sql: ${TABLE}.auth_request_params ;;
  }

  dimension: authorization_endpoint {
    type: string
    sql: ${TABLE}.authorization_endpoint ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: encrypted_client_secret {
    type: string
    sql: ${TABLE}.encrypted_client_secret ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: refresh_token_expires_in_default {
    type: number
    sql: ${TABLE}.refresh_token_expires_in_default ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_refresh_token_expires_in_default {
    type: sum
    sql: ${refresh_token_expires_in_default} ;;  }
  measure: average_refresh_token_expires_in_default {
    type: average
    sql: ${refresh_token_expires_in_default} ;;  }

  dimension: refresh_token_returned_only_once {
    type: yesno
    sql: ${TABLE}.refresh_token_returned_only_once ;;
  }

  dimension: token_endpoint {
    type: string
    sql: ${TABLE}.token_endpoint ;;
  }

  dimension: uses_basic_auth {
    type: yesno
    sql: ${TABLE}.uses_basic_auth ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, db_connection.count, oauth_user_state.count]
  }
}
