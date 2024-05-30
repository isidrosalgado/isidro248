# The name of this view in Looker is "Marketplace Auto Installable Listings"
view: marketplace_auto_installable_listings {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.marketplace_auto_installable_listings ;;
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
    # This dimension will be called "Can Update" in Explore.

  dimension: can_update {
    type: yesno
    sql: ${TABLE}.can_update ;;
  }

  dimension: listing_id {
    type: string
    sql: ${TABLE}.listing_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
