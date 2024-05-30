# The name of this view in Looker is "Saml Group Role"
view: saml_group_role {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.saml_group_role ;;
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
    # This dimension will be called "Role ID" in Explore.

  dimension: role_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.role_id ;;
  }

  dimension: saml_group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.saml_group_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, saml_group.id, saml_group.name, role.id, role.name]
  }
}
