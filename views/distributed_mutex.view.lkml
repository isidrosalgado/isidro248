# The name of this view in Looker is "Distributed Mutex"
view: distributed_mutex {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.distributed_mutex ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_heartbeat {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_heartbeat ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Name" in Explore.

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: node_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.node_id ;;
  }

  dimension: thread_id {
    type: string
    sql: ${TABLE}.thread_id ;;
  }
  measure: count {
    type: count
    drill_fields: [name, node.hostname, node.prev_node_id]
  }
}
