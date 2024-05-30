# The name of this view in Looker is "Field Usage"
view: field_usage {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.field_usage ;;
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
    # This dimension will be called "Base View" in Explore.

  dimension: base_view {
    type: string
    sql: ${TABLE}.base_view ;;
  }

  dimension: field {
    type: string
    sql: ${TABLE}.field ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: times_used {
    type: number
    sql: ${TABLE}.times_used ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_times_used {
    type: sum
    sql: ${times_used} ;;  }
  measure: average_times_used {
    type: average
    sql: ${times_used} ;;  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
