# The name of this view in Looker is "Encryption Key"
view: encryption_key {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.encryption_key ;;
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
    # This dimension will be called "Active" in Explore.

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: cmek_key_name_version {
    type: string
    sql: ${TABLE}.cmek_key_name_version ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: cmek_last_known_transition {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.cmek_last_known_transition ;;
  }

  dimension: cmek_valid {
    type: yesno
    sql: ${TABLE}.cmek_valid ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: encrypted_key {
    type: string
    sql: ${TABLE}.encrypted_key ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
