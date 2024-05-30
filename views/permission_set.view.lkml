# The name of this view in Looker is "Permission Set"
view: permission_set {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.permission_set ;;
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
    # This dimension will be called "Built In" in Explore.

  dimension: built_in {
    type: yesno
    sql: ${TABLE}.built_in ;;
  }

  dimension: embed {
    type: yesno
    sql: ${TABLE}.embed ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: permissions {
    type: string
    sql: ${TABLE}.permissions ;;
  }

  dimension: unlimited {
    type: yesno
    sql: ${TABLE}.unlimited ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, role.count]
  }
}
