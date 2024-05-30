# The name of this view in Looker is "Content Digest Item"
view: content_digest_item {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.content_digest_item ;;
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
    # This dimension will be called "Content ID" in Explore.

  dimension: content_id {
    type: string
    sql: ${TABLE}.content_id ;;
  }

  dimension: content_type {
    type: string
    sql: ${TABLE}.content_type ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: user_content_digest_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_content_digest_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, user_content_digest.id]
  }
}
