# The name of this view in Looker is "Vis Config Queries"
view: vis_config_queries {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.vis_config_queries ;;
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
    # This dimension will be called "Result Maker Slug" in Explore.

  dimension: result_maker_slug {
    type: string
    sql: ${TABLE}.result_maker_slug ;;
  }

  dimension: vis_config_slug {
    type: string
    sql: ${TABLE}.vis_config_slug ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
