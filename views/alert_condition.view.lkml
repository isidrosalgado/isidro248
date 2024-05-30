# The name of this view in Looker is "Alert Condition"
view: alert_condition {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.alert_condition ;;
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
    # This dimension will be called "Applied Dashboard Filters" in Explore.

  dimension: applied_dashboard_filters {
    type: string
    sql: ${TABLE}.applied_dashboard_filters ;;
  }

  dimension: base_query_id {
    type: number
    sql: ${TABLE}.base_query_id ;;
  }

  dimension: condition_query_id {
    type: number
    sql: ${TABLE}.condition_query_id ;;
  }

  dimension: condition_strategy {
    type: string
    sql: ${TABLE}.condition_strategy ;;
  }

  dimension: condition_type {
    type: string
    sql: ${TABLE}.condition_type ;;
  }

  dimension: field_name {
    type: string
    sql: ${TABLE}.field_name ;;
  }

  dimension: field_selection_filters {
    type: string
    sql: ${TABLE}.field_selection_filters ;;
  }

  dimension: field_title {
    type: string
    sql: ${TABLE}.field_title ;;
  }

  dimension: threshold_value {
    type: string
    sql: ${TABLE}.threshold_value ;;
  }

  dimension: time_series_dimension {
    type: string
    sql: ${TABLE}.time_series_dimension ;;
  }
  measure: count {
    type: count
    drill_fields: [id, field_name, alert.count, alert_condition_result.count, alert_time_series_condition_state.count]
  }
}
