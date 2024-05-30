# The name of this view in Looker is "Saml User Attribute Attribute"
view: saml_user_attribute_attribute {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: gcpl248.saml_user_attribute_attribute ;;
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
    # This dimension will be called "Saml User Attribute ID" in Explore.

  dimension: saml_user_attribute_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.saml_user_attribute_id ;;
  }

  dimension: user_attribute_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_attribute_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, saml_user_attribute.id, saml_user_attribute.name, user_attribute.id]
  }
}
