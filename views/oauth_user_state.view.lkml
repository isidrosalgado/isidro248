# The name of this view in Looker is "Oauth User State"
view: oauth_user_state {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.oauth_user_state ;;
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
    # This dimension will be called "Access Token Expires At" in Explore.

  dimension: access_token_expires_at {
    type: number
    sql: ${TABLE}.access_token_expires_at ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_access_token_expires_at {
    type: sum
    sql: ${access_token_expires_at} ;;  }
  measure: average_access_token_expires_at {
    type: average
    sql: ${access_token_expires_at} ;;  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: encrypted_access_token {
    type: string
    sql: ${TABLE}.encrypted_access_token ;;
  }

  dimension: encrypted_refresh_token {
    type: string
    sql: ${TABLE}.encrypted_refresh_token ;;
  }

  dimension: expiry_last_checked_at {
    type: number
    sql: ${TABLE}.expiry_last_checked_at ;;
  }

  dimension: oauth_application_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.oauth_application_id ;;
  }

  dimension: refresh_token_expires_at {
    type: number
    sql: ${TABLE}.refresh_token_expires_at ;;
  }

  dimension: scope {
    type: string
    sql: ${TABLE}.scope ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	user.first_name,
	user.last_name,
	user.dev_mode_user_id,
	user.dev_branch_name,
	oauth_application.id,
	oauth_application.name,
	oauth_request_state.count
	]
  }

}
