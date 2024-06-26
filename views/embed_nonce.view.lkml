# The name of this view in Looker is "Embed Nonce"
view: embed_nonce {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.embed_nonce ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "External User ID" in Explore.

  dimension: external_user_id {
    type: string
    sql: ${TABLE}.external_user_id ;;
  }

  dimension: nonce {
    type: string
    sql: ${TABLE}.nonce ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
