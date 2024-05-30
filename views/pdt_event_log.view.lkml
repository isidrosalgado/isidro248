# The name of this view in Looker is "Pdt Event Log"
view: pdt_event_log {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.pdt_event_log ;;
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

  dimension: action_data {
    type: string
    sql: ${TABLE}.action_data ;;
  }

  dimension: at {
    type: number
    sql: ${TABLE}.at ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_at {
    type: sum
    sql: ${at} ;;  }
  measure: average_at {
    type: average
    sql: ${at} ;;  }

  dimension: connection {
    type: string
    sql: ${TABLE}.connection ;;
  }

  dimension: hash_key {
    type: string
    sql: ${TABLE}.hash_key ;;
  }

  dimension: model_name {
    type: string
    sql: ${TABLE}.model_name ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.table_name ;;
  }

  dimension: tid {
    type: string
    sql: ${TABLE}.tid ;;
  }

  dimension: tseq {
    type: number
    sql: ${TABLE}.tseq ;;
  }

  dimension: view_name {
    type: string
    sql: ${TABLE}.view_name ;;
  }
  measure: count {
    type: count
    drill_fields: [id, model_name, view_name, table_name]
  }
}
