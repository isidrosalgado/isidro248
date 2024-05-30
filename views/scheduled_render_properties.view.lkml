# The name of this view in Looker is "Scheduled Render Properties"
view: scheduled_render_properties {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.scheduled_render_properties ;;
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
    # This dimension will be called "Color Theme" in Explore.

  dimension: color_theme {
    type: string
    sql: ${TABLE}.color_theme ;;
  }

  dimension: embed {
    type: yesno
    sql: ${TABLE}.embed ;;
  }

  dimension: inline_table_width {
    type: number
    sql: ${TABLE}.inline_table_width ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_inline_table_width {
    type: sum
    sql: ${inline_table_width} ;;  }
  measure: average_inline_table_width {
    type: average
    sql: ${inline_table_width} ;;  }

  dimension: long_tables {
    type: yesno
    sql: ${TABLE}.long_tables ;;
  }

  dimension: properties_version {
    type: number
    sql: ${TABLE}.properties_version ;;
  }

  dimension: scheduled_plan_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.scheduled_plan_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, scheduled_plan.id, scheduled_plan.name, scheduled_job.count]
  }
}
