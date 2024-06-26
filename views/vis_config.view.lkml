# The name of this view in Looker is "Vis Config"
view: vis_config {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.vis_config ;;
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
    # This dimension will be called "Config" in Explore.

  dimension: config {
    type: string
    sql: ${TABLE}.config ;;
  }

  dimension: hash {
    type: string
    sql: ${TABLE}.hash ;;
  }

  dimension: slug {
    type: string
    sql: ${TABLE}.slug ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
