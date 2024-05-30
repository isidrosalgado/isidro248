# The name of this view in Looker is "Marketplace Installation"
view: marketplace_installation {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.marketplace_installation ;;
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
    # This dimension will be called "Accepted Entitlement Ids" in Explore.

  dimension: accepted_entitlement_ids {
    type: string
    sql: ${TABLE}.accepted_entitlement_ids ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: entitlements_accepted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.entitlements_accepted_at ;;
  }

  dimension: entitlements_accepted_by_user_id {
    type: number
    sql: ${TABLE}.entitlements_accepted_by_user_id ;;
  }

  dimension: git_sha {
    type: string
    sql: ${TABLE}.git_sha ;;
  }

  dimension: git_uri {
    type: string
    sql: ${TABLE}.git_uri ;;
  }

  dimension_group: license_accepted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.license_accepted_at ;;
  }

  dimension: license_accepted_by_user_id {
    type: number
    sql: ${TABLE}.license_accepted_by_user_id ;;
  }

  dimension: license_accepted_hash {
    type: string
    sql: ${TABLE}.license_accepted_hash ;;
  }

  dimension: marketplace_listing_id {
    type: string
    sql: ${TABLE}.marketplace_listing_id ;;
  }

  dimension: package_metadata {
    type: string
    sql: ${TABLE}.package_metadata ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: update_version_status {
    type: string
    sql: ${TABLE}.update_version_status ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
