databaseChangeLog = {

	changeSet(author: "Fyv (generated)", id: "1360355876258-1") {
		createTable(tableName: "consultation") {
			column(name: "id", type: "int8") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "consultation_pkey")
			}

			column(name: "version", type: "int8") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "TIMESTAMP WITH TIME ZONE") {
				constraints(nullable: "false")
			}

			column(name: "doleance", type: "TEXT")

			column(name: "last_updated", type: "TIMESTAMP WITH TIME ZONE")

			column(name: "motif", type: "TEXT") {
				constraints(nullable: "false")
			}

			column(name: "patient_id", type: "int8") {
				constraints(nullable: "false")
			}

			column(name: "traitement", type: "TEXT")
		}
	}

	changeSet(author: "Fyv (generated)", id: "1360355876258-2") {
		createTable(tableName: "patient") {
			column(name: "id", type: "int8") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "patient_pkey")
			}

			column(name: "version", type: "int8") {
				constraints(nullable: "false")
			}

			column(name: "adresse", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "adresse_suite", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "chirurgical", type: "TEXT") {
				constraints(nullable: "false")
			}

			column(name: "civilite", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "complementaire", type: "TEXT") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "TIMESTAMP WITH TIME ZONE") {
				constraints(nullable: "false")
			}

			column(name: "date_naissance", type: "TIMESTAMP WITH TIME ZONE") {
				constraints(nullable: "false")
			}

			column(name: "email", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "famille", type: "TEXT") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "TIMESTAMP WITH TIME ZONE")

			column(name: "loisir", type: "TEXT") {
				constraints(nullable: "false")
			}

			column(name: "medical", type: "TEXT") {
				constraints(nullable: "false")
			}

			column(name: "naissance", type: "TEXT") {
				constraints(nullable: "false")
			}

			column(name: "nom", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "prenom", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "profession", type: "TEXT") {
				constraints(nullable: "false")
			}

			column(name: "remarque", type: "TEXT") {
				constraints(nullable: "false")
			}

			column(name: "sexe", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "tel_fixe", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "tel_portable", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "traumatisme", type: "TEXT") {
				constraints(nullable: "false")
			}

			column(name: "utilisateur_id", type: "int8") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "Fyv (generated)", id: "1360355876258-3") {
		createTable(tableName: "role") {
			column(name: "id", type: "int8") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "role_pkey")
			}

			column(name: "version", type: "int8") {
				constraints(nullable: "false")
			}

			column(name: "authority", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "Fyv (generated)", id: "1360355876258-4") {
		createTable(tableName: "utilisateur") {
			column(name: "id", type: "int8") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "utilisateur_pkey")
			}

			column(name: "version", type: "int8") {
				constraints(nullable: "false")
			}

			column(name: "account_expired", type: "bool") {
				constraints(nullable: "false")
			}

			column(name: "account_locked", type: "bool") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "TIMESTAMP WITH TIME ZONE") {
				constraints(nullable: "false")
			}

			column(name: "email", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "enabled", type: "bool") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "TIMESTAMP WITH TIME ZONE")

			column(name: "nom", type: "VARCHAR(255)")

			column(name: "password", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "password_expired", type: "bool") {
				constraints(nullable: "false")
			}

			column(name: "prenom", type: "VARCHAR(255)")

			column(name: "username", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "Fyv (generated)", id: "1360355876258-5") {
		createTable(tableName: "utilisateur_role") {
			column(name: "role_id", type: "int8") {
				constraints(nullable: "false")
			}

			column(name: "utilisateur_id", type: "int8") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "Fyv (generated)", id: "1360355876258-6") {
		addPrimaryKey(columnNames: "role_id, utilisateur_id", constraintName: "utilisateur_role_pkey", tableName: "utilisateur_role")
	}

	changeSet(author: "Fyv (generated)", id: "1360355876258-7") {
		addUniqueConstraint(columnNames: "authority", constraintName: "role_authority_key", deferrable: "false", disabled: "false", initiallyDeferred: "false", tableName: "role")
	}

	changeSet(author: "Fyv (generated)", id: "1360355876258-8") {
		addUniqueConstraint(columnNames: "username", constraintName: "utilisateur_username_key", deferrable: "false", disabled: "false", initiallyDeferred: "false", tableName: "utilisateur")
	}

	changeSet(author: "Fyv (generated)", id: "1360355876258-9") {
		addForeignKeyConstraint(baseColumnNames: "patient_id", baseTableName: "consultation", baseTableSchemaName: "public", constraintName: "fkb1b2d2895a01ced4", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "patient", referencedTableSchemaName: "public", referencesUniqueColumn: "false")
	}

	changeSet(author: "Fyv (generated)", id: "1360355876258-10") {
		addForeignKeyConstraint(baseColumnNames: "utilisateur_id", baseTableName: "patient", baseTableSchemaName: "public", constraintName: "fkd0d3eb0553c50ab5", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "utilisateur", referencedTableSchemaName: "public", referencesUniqueColumn: "false")
	}

	changeSet(author: "Fyv (generated)", id: "1360355876258-11") {
		addForeignKeyConstraint(baseColumnNames: "role_id", baseTableName: "utilisateur_role", baseTableSchemaName: "public", constraintName: "fkccccbfb2b8e1fa7f", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "role", referencedTableSchemaName: "public", referencesUniqueColumn: "false")
	}

	changeSet(author: "Fyv (generated)", id: "1360355876258-12") {
		addForeignKeyConstraint(baseColumnNames: "utilisateur_id", baseTableName: "utilisateur_role", baseTableSchemaName: "public", constraintName: "fkccccbfb253c50ab5", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "utilisateur", referencedTableSchemaName: "public", referencesUniqueColumn: "false")
	}

	changeSet(author: "Fyv (generated)", id: "1360355876258-13") {
		createSequence(schemaName: "public", sequenceName: "hibernate_sequence")
	}
}
