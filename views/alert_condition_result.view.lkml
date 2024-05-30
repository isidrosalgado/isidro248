# The name of this view in Looker is "Alert Condition Result"
view: alert_condition_result {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.alert_condition_result ;;
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
    # This dimension will be called "Alert Condition ID" in Explore.

  dimension: alert_condition_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.alert_condition_id ;;
  }

  dimension: alert_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.alert_id ;;
  }

  dimension: condition_met {
    type: yesno
    sql: ${TABLE}.condition_met ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension: notification_sent {
    type: yesno
    sql: ${TABLE}.notification_sent ;;
  }

  dimension: query_history_id {
    type: string
    sql: ${TABLE}.query_history_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: query_ran {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.query_ran_at ;;
  }

  dimension_group: ran_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ran_at ;;
  }

  dimension: runtime {
    type: number
    sql: ${TABLE}.runtime ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_runtime {
    type: sum
    sql: ${runtime} ;;  }
  measure: average_runtime {
    type: average
    sql: ${runtime} ;;  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: template_data {
    type: string
    sql: ${TABLE}.template_data ;;
  }

  dimension: threshold_value {
    type: number
    sql: ${TABLE}.threshold_value ;;
  }
  measure: count {
    type: count
    drill_fields: [id, alert.id, alert_condition.id, alert_condition.field_name, alert_notification.count]
  }
}
