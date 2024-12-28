# Gaming-Data-Hub

Database and Schema Import (Windows):
1. Connect to your database.
2. In MySQL go to the "Server" dropdown on the menu bar.
3. Select "Data Import"
4. Select radio button "Import from Self-Contained File"
5. Select file location.
6. Select Target Schema from dropdown or create a new one by selecting "New..."
   and labeling it "group2project".

Database and Schema Export Instructions (Windows):
1. Connect to your database.
2. In MySQL go to the "Server" dropdown on the menu bar.
3. Select "Data Export"
4. Ensure checkbox for correct schema is checked.
5. Select radio button labeled "Export to Self-Contained File".
6. Select location to export by clicking elipsis next to field.
7. Click "Start Export"

After that:
1. Open GamingPlatformGUI on your IDE (NetBeans, IntelliJ, etc.)
2. Run MySQL scripts
3. Modify in SQLConnection.java, SQL_PASSWORD to be your database password
4. Could cause an issue if your JDK is not up to date. Go to Project Files>pom.xml>edit JDK source/target (assuming you had the JDK downloaded)
5. Run the JAVA code in your IDE
