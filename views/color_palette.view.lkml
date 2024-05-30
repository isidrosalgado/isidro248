# The name of this view in Looker is "Color Palette"
view: color_palette {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.color_palette ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Color Collection ID" in Explore.

  dimension: color_collection_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.color_collection_id ;;
  }

  dimension: color_options {
    type: string
    sql: ${TABLE}.color_options ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: order {
    type: number
    sql: ${TABLE}.`order` ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_order {
    type: sum
    sql: ${order} ;;  }
  measure: average_order {
    type: average
    sql: ${order} ;;  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  measure: count {
    type: count
    drill_fields: [id, color_collection.id]
  }
}
