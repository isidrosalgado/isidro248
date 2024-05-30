# The name of this view in Looker is "Looker Q Looker Bq Activemq Msgs"
view: looker_q_looker_bq_activemq_msgs {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.LookerQ_LookerBQ_ACTIVEMQ_MSGS ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Container" in Explore.

  dimension: container {
    type: string
    sql: ${TABLE}.CONTAINER ;;
  }

  dimension: expiration {
    type: number
    sql: ${TABLE}.EXPIRATION ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_expiration {
    type: sum
    sql: ${expiration} ;;  }
  measure: average_expiration {
    type: average
    sql: ${expiration} ;;  }

  dimension: msg {
    type: string
    sql: ${TABLE}.MSG ;;
  }

  dimension: msgid_prod {
    type: string
    sql: ${TABLE}.MSGID_PROD ;;
  }

  dimension: msgid_seq {
    type: number
    sql: ${TABLE}.MSGID_SEQ ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}.PRIORITY ;;
  }

  dimension: xid {
    type: string
    sql: ${TABLE}.XID ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
