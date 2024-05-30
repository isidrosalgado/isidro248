# The name of this view in Looker is "Alert Notification"
view: alert_notification {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.alert_notification ;;
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
    # This dimension will be called "Alert Condition Result ID" in Explore.

  dimension: alert_condition_result_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.alert_condition_result_id ;;
  }

  dimension: state {
    type: number
    sql: ${TABLE}.state ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_state {
    type: sum
    sql: ${state} ;;  }
  measure: average_state {
    type: average
    sql: ${state} ;;  }

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
	alert_condition_result.id,
	user.first_name,
	user.last_name,
	user.dev_mode_user_id,
	user.dev_branch_name
	]
  }

}
