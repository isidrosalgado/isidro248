# The name of this view in Looker is "Result Maker"
view: result_maker {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.result_maker ;;
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
    # This dimension will be called "Merge Query ID" in Explore.

  dimension: merge_query_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.merge_query_id ;;
  }

  dimension: query_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.query_id ;;
  }

  dimension: slug {
    type: string
    sql: ${TABLE}.slug ;;
  }

  dimension: sql_interface_query_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.sql_interface_query_id ;;
  }

  dimension: sql_query_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.sql_query_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	query.id,
	merge_query.id,
	sql_query.id,
	sql_query.model_name,
	sql_interface_query.id,
	dashboard_element.count,
	history.count,
	query_task.count,
	slug.count
	]
  }

}
