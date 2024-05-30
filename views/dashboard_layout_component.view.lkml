# The name of this view in Looker is "Dashboard Layout Component"
view: dashboard_layout_component {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.dashboard_layout_component ;;
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
    # This dimension will be called "Column" in Explore.

  dimension: column {
    type: number
    sql: ${TABLE}.`column` ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_column {
    type: sum
    sql: ${column} ;;  }
  measure: average_column {
    type: average
    sql: ${column} ;;  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: dashboard_element_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.dashboard_element_id ;;
  }

  dimension: dashboard_layout_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.dashboard_layout_id ;;
  }

  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: height {
    type: number
    sql: ${TABLE}.height ;;
  }

  dimension: lookml_link_id {
    type: string
    sql: ${TABLE}.lookml_link_id ;;
  }

  dimension: row {
    type: number
    sql: ${TABLE}.row ;;
  }

  dimension: width {
    type: number
    sql: ${TABLE}.width ;;
  }
  measure: count {
    type: count
    drill_fields: [id, dashboard_layout.id, dashboard_element.id]
  }
}
