const String tableName = 'customer';
const String demoDb = 'demo.db';
const String columnId = 'customer_id';
const String columnFirstName = 'first_name';
const String columnLastName = 'last_name';
const String columnDateOfBirth = 'date_of_birth';
const String columnPhoneNumber = 'phone_number';
const String columnEmail = 'email';
const String columnBankAccountNumber = "bank_account_number";

const String databaseRules = '''
create table $tableName ( 
  $columnId INTEGER PRIMARY KEY autoincrement, 
  $columnFirstName TEXT NOT NULL,
  $columnLastName TEXT NOT NULL,
  $columnDateOfBirth DATETIME,
  $columnPhoneNumber TEXT NOT NULL UNIQUE,
  $columnEmail TEXT NOT NULL UNIQUE,
  $columnBankAccountNumber TEXT NOT NULL UNIQUE
)
''';
