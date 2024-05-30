# The name of this view in Looker is "Dashboard Filter"
view: dashboard_filter {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.dashboard_filter ;;
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
    # This dimension will be called "Allow Multiple Values" in Explore.

  dimension: allow_multiple_values {
    type: yesno
    sql: ${TABLE}.allow_multiple_values ;;
  }

  dimension: dashboard_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.dashboard_id ;;
  }

  dimension: default_value {
    type: string
    sql: ${TABLE}.default_value ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: dimension {
    type: string
    sql: ${TABLE}.dimension ;;
  }

  dimension: explore {
    type: string
    sql: ${TABLE}.explore ;;
  }

  dimension: listens_to_filters_json {
    type: string
    sql: ${TABLE}.listens_to_filters_json ;;
  }

  dimension: lookml_link_id {
    type: string
    sql: ${TABLE}.lookml_link_id ;;
  }

  dimension: model_name {
    type: string
    sql: ${TABLE}.model_name ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: required {
    type: yesno
    sql: ${TABLE}.required ;;
  }

  dimension: row {
    type: number
    sql: ${TABLE}.row ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_row {
    type: sum
    sql: ${row} ;;  }
  measure: average_row {
    type: average
    sql: ${row} ;;  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: ui_config {
    type: string
    sql: ${TABLE}.ui_config ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, model_name, dashboard.id]
  }
}
