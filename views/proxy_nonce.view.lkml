# The name of this view in Looker is "Proxy Nonce"
view: proxy_nonce {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.proxy_nonce ;;
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
    # This dimension will be called "Created At" in Explore.

  dimension: created_at {
    type: number
    sql: ${TABLE}.created_at ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_created_at {
    type: sum
    sql: ${created_at} ;;  }
  measure: average_created_at {
    type: average
    sql: ${created_at} ;;  }

  dimension: expires_at {
    type: number
    sql: ${TABLE}.expires_at ;;
  }

  dimension: nonce {
    type: string
    sql: ${TABLE}.nonce ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, user.first_name, user.last_name, user.dev_mode_user_id, user.dev_branch_name]
  }
}
