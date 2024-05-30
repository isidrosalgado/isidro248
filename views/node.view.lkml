# The name of this view in Looker is "Node"
view: node {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.node ;;
  drill_fields: [prev_node_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: prev_node_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.prev_node_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cache Port" in Explore.

  dimension: cache_port {
    type: string
    sql: ${TABLE}.cache_port ;;
  }

  dimension: clustered {
    type: yesno
    sql: ${TABLE}.clustered ;;
  }

  dimension: health_status {
    type: string
    sql: ${TABLE}.health_status ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: is_master {
    type: yesno
    sql: ${TABLE}.is_master ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_heartbeat {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_heartbeat ;;
  }

  dimension: mac_adress {
    type: string
    sql: ${TABLE}.mac_adress ;;
  }

  dimension: new_secret {
    type: string
    sql: ${TABLE}.new_secret ;;
  }

  dimension: node_cluster_version {
    type: number
    sql: ${TABLE}.node_cluster_version ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_node_cluster_version {
    type: sum
    sql: ${node_cluster_version} ;;  }
  measure: average_node_cluster_version {
    type: average
    sql: ${node_cluster_version} ;;  }

  dimension: node_to_node_port {
    type: string
    sql: ${TABLE}.node_to_node_port ;;
  }

  dimension: old_secret {
    type: string
    sql: ${TABLE}.old_secret ;;
  }

  dimension: port {
    type: string
    sql: ${TABLE}.port ;;
  }

  dimension: queue_broker_port {
    type: string
    sql: ${TABLE}.queue_broker_port ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	prev_node_id,
	hostname,
	active_data_maintenance_task.count,
	active_pdt_materialize_task.count,
	active_pdt_publish_task.count,
	active_pdt_scraper_task.count,
	cache_index.count,
	distributed_mutex.count,
	history.count,
	query_task.count,
	render_job.count,
	scheduled_job_stage.count,
	system_status.count
	]
  }

}
