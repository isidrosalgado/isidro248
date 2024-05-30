# The name of this view in Looker is "Looker Q Looker Bq Activemq Acks"
view: looker_q_looker_bq_activemq_acks {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.LookerQ_LookerBQ_ACTIVEMQ_ACKS ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Client ID" in Explore.

  dimension: client_id {
    type: string
    sql: ${TABLE}.CLIENT_ID ;;
  }

  dimension: container {
    type: string
    sql: ${TABLE}.CONTAINER ;;
  }

  dimension: last_acked_id {
    type: number
    sql: ${TABLE}.LAST_ACKED_ID ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}.PRIORITY ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_priority {
    type: sum
    sql: ${priority} ;;  }
  measure: average_priority {
    type: average
    sql: ${priority} ;;  }

  dimension: selector {
    type: string
    sql: ${TABLE}.SELECTOR ;;
  }

  dimension: sub_dest {
    type: string
    sql: ${TABLE}.SUB_DEST ;;
  }

  dimension: sub_name {
    type: string
    sql: ${TABLE}.SUB_NAME ;;
  }

  dimension: xid {
    type: string
    sql: ${TABLE}.XID ;;
  }
  measure: count {
    type: count
    drill_fields: [sub_name]
  }
}
