//databaseChangeLog = {
//
//	changeSet(author: "Fyv (generated)", id: "1360665241707-1") {
//		addColumn(tableName: "patient") {
//			column(name: "posturologie", type: "text") {
//				constraints(nullable: "false")
//			}
//		}
//	}
//
//	changeSet(author: "Fyv (generated)", id: "1360665241707-2") {
//		dropForeignKeyConstraint(baseTableName: "persistent_session_attribute", baseTableSchemaName: "public", constraintName: "fk50c6048b92381d29")
//	}
//
//	changeSet(author: "Fyv (generated)", id: "1360665241707-3") {
//		dropForeignKeyConstraint(baseTableName: "persistent_session_attribute_value", baseTableSchemaName: "public", constraintName: "fk1efe24bdf830abf5")
//	}
//
//	changeSet(author: "Fyv (generated)", id: "1360665241707-4") {
//		dropColumn(columnName: "famille", tableName: "patient")
//	}
//
//	changeSet(author: "Fyv (generated)", id: "1360665241707-5") {
//		dropTable(tableName: "persistent_session")
//	}
//
//	changeSet(author: "Fyv (generated)", id: "1360665241707-6") {
//		dropTable(tableName: "persistent_session_attribute")
//	}
//
//	changeSet(author: "Fyv (generated)", id: "1360665241707-7") {
//		dropTable(tableName: "persistent_session_attribute_value")
//	}
//}
