# The name of this view in Looker is "Alert Sync History"
view: alert_sync_history {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.alert_sync_history ;;
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
    # This dimension will be called "Action" in Explore.

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }

  dimension: alert_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.alert_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: new_alert_condition_id {
    type: number
    sql: ${TABLE}.new_alert_condition_id ;;
  }

  dimension_group: notified {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.notified_at ;;
  }

  dimension: original_alert_condition_id {
    type: number
    sql: ${TABLE}.original_alert_condition_id ;;
  }

  dimension: sync_classification_result {
    type: string
    sql: ${TABLE}.sync_classification_result ;;
  }

  dimension: sync_type {
    type: string
    sql: ${TABLE}.sync_type ;;
  }
  measure: count {
    type: count
    drill_fields: [id, alert.id]
  }
}
