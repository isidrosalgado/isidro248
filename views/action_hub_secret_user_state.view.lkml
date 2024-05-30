# The name of this view in Looker is "Action Hub Secret User State"
view: action_hub_secret_user_state {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.action_hub_secret_user_state ;;
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
    # This dimension will be called "Action ID" in Explore.

  dimension: action_id {
    type: string
    sql: ${TABLE}.action_id ;;
  }

  dimension: encrypted_action_hub_secret_state {
    type: string
    sql: ${TABLE}.encrypted_action_hub_secret_state ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: next_run {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.next_run_at ;;
  }

  dimension: ttl_seconds {
    type: number
    sql: ${TABLE}.ttl_seconds ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_ttl_seconds {
    type: sum
    sql: ${ttl_seconds} ;;  }
  measure: average_ttl_seconds {
    type: average
    sql: ${ttl_seconds} ;;  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, user.first_name, user.last_name, user.dev_mode_user_id, user.dev_branch_name]
  }
}
