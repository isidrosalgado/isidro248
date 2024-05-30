# The name of this view in Looker is "Version Set"
view: version_set {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.version_set ;;
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
    # This dimension will be called "Current Version" in Explore.

  dimension: current_version {
    type: string
    sql: ${TABLE}.current_version ;;
  }

  dimension: hash {
    type: string
    sql: ${TABLE}.hash ;;
  }

  dimension: versions {
    type: string
    sql: ${TABLE}.versions ;;
  }
  measure: count {
    type: count
    drill_fields: [id, user.count]
  }
}
