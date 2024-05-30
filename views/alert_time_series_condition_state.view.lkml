# The name of this view in Looker is "Alert Time Series Condition State"
view: alert_time_series_condition_state {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.alert_time_series_condition_state ;;
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

  dimension: condition_met {
    type: yesno
    sql: ${TABLE}.condition_met ;;
  }

  dimension: latest_time_series_id {
    type: string
    sql: ${TABLE}.latest_time_series_id ;;
  }

  dimension: previous_time_series_id {
    type: string
    sql: ${TABLE}.previous_time_series_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, alert_condition.id, alert_condition.field_name]
  }
}
