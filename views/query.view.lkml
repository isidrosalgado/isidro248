# The name of this view in Looker is "Query"
view: query {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.query ;;
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
    # This dimension will be called "Client ID" in Explore.

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: column_limit {
    type: string
    sql: ${TABLE}.column_limit ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: dynamic_fields {
    type: string
    sql: ${TABLE}.dynamic_fields ;;
  }

  dimension: fields {
    type: string
    sql: ${TABLE}.fields ;;
  }

  dimension: fill_fields {
    type: string
    sql: ${TABLE}.fill_fields ;;
  }

  dimension: filter_config {
    type: string
    sql: ${TABLE}.filter_config ;;
  }

  dimension: filter_expression {
    type: string
    sql: ${TABLE}.filter_expression ;;
  }

  dimension: filters {
    type: string
    sql: ${TABLE}.filters ;;
  }

  dimension: hash {
    type: string
    sql: ${TABLE}.hash ;;
  }

  dimension: limit {
    type: string
    sql: ${TABLE}.`limit` ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: pivots {
    type: string
    sql: ${TABLE}.pivots ;;
  }

  dimension: query_timezone {
    type: string
    sql: ${TABLE}.query_timezone ;;
  }

  dimension: row_total {
    type: string
    sql: ${TABLE}.row_total ;;
  }

  dimension: runtime {
    type: number
    sql: ${TABLE}.runtime ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_runtime {
    type: sum
    sql: ${runtime} ;;  }
  measure: average_runtime {
    type: average
    sql: ${runtime} ;;  }

  dimension: slug {
    type: string
    sql: ${TABLE}.slug ;;
  }

  dimension: sorts {
    type: string
    sql: ${TABLE}.sorts ;;
  }

  dimension: subtotals {
    type: string
    sql: ${TABLE}.subtotals ;;
  }

  dimension: total {
    type: yesno
    sql: ${TABLE}.total ;;
  }

  dimension: view {
    type: string
    sql: ${TABLE}.view ;;
  }

  dimension: vis_config {
    type: string
    sql: ${TABLE}.vis_config ;;
  }

  dimension: visible_ui_sections {
    type: string
    sql: ${TABLE}.visible_ui_sections ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	dashboard_element.count,
	history.count,
	look.count,
	merge_query_source_query.count,
	query_analysis_config.count,
	query_task.count,
	result_maker.count,
	scheduled_job.count,
	scheduled_plan.count,
	slug.count
	]
  }

}
