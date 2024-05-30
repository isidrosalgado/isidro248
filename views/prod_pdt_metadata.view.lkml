# The name of this view in Looker is "Prod Pdt Metadata"
view: prod_pdt_metadata {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.prod_pdt_metadata ;;
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
    # This dimension will be called "Connection" in Explore.

  dimension: connection {
    type: string
    sql: ${TABLE}.connection ;;
  }

  dimension: increment_key {
    type: string
    sql: ${TABLE}.increment_key ;;
  }

  dimension: increment_offset {
    type: number
    sql: ${TABLE}.increment_offset ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_increment_offset {
    type: sum
    sql: ${increment_offset} ;;  }
  measure: average_increment_offset {
    type: average
    sql: ${increment_offset} ;;  }

  dimension: is_incremental {
    type: yesno
    sql: ${TABLE}.is_incremental ;;
  }

  dimension: is_materialized_view {
    type: yesno
    sql: ${TABLE}.is_materialized_view ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.`key` ;;
  }

  dimension: models {
    type: string
    sql: ${TABLE}.models ;;
  }

  dimension: pdt_type {
    type: string
    sql: ${TABLE}.pdt_type ;;
  }

  dimension: persistence_str {
    type: string
    sql: ${TABLE}.persistence_str ;;
  }

  dimension: project {
    type: string
    sql: ${TABLE}.project ;;
  }

  dimension: publish_as_db_view {
    type: yesno
    sql: ${TABLE}.publish_as_db_view ;;
  }

  dimension: source_url {
    type: string
    sql: ${TABLE}.source_url ;;
  }

  dimension: structure {
    type: string
    sql: ${TABLE}.structure ;;
  }

  dimension: view {
    type: string
    sql: ${TABLE}.view ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
