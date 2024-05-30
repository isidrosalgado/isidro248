# The name of this view in Looker is "Merge Query Source Query"
view: merge_query_source_query {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.merge_query_source_query ;;
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
    # This dimension will be called "Merge Fields" in Explore.

  dimension: merge_fields {
    type: string
    sql: ${TABLE}.merge_fields ;;
  }

  dimension: merge_query_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.merge_query_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: query_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.query_id ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_rank {
    type: sum
    sql: ${rank} ;;  }
  measure: average_rank {
    type: average
    sql: ${rank} ;;  }
  measure: count {
    type: count
    drill_fields: [id, name, merge_query.id, query.id]
  }
}
