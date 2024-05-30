# The name of this view in Looker is "IP Whitelist Rule"
view: ip_whitelist_rule {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.ip_whitelist_rule ;;
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
    # This dimension will be called "Allow Core API Traffic" in Explore.

  dimension: allow_core_api_traffic {
    type: yesno
    sql: ${TABLE}.allow_core_api_traffic ;;
  }

  dimension: allow_internal_api_traffic {
    type: yesno
    sql: ${TABLE}.allow_internal_api_traffic ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: delete_on_disable_support_access {
    type: yesno
    sql: ${TABLE}.delete_on_disable_support_access ;;
  }

  dimension: enabled {
    type: yesno
    sql: ${TABLE}.enabled ;;
  }

  dimension: ip {
    type: string
    sql: ${TABLE}.ip ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: subnet_mask {
    type: string
    sql: ${TABLE}.subnet_mask ;;
  }

  dimension: whitelists_bastion {
    type: yesno
    sql: ${TABLE}.whitelists_bastion ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
