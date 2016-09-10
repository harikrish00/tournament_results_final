# tournament_results_final
Project for reporting and conducting swiss style chess tournaments

# Set up vagrant environment

1. Create a vagrant box and provision with necessary tool chains

```shell
$ vagrant up
```

2. Login to the box

```shell
$ vagrant ssh
$ cd /vagrant
```

3. Setup database and tables

```shell
$psql
vagrant> \i tournament.sql;
vagrant> \q
```

4. Run the test to make sure everything is working

```shell
$python tournmanet_test.py
```


#### Files and its purpose:
- tournament.py # Contains the actual logic for tournament results
- tournament.sql # Contains the sql statement for creating database, tables and
  views
- tournament_test.py # Master test file contains all the test cases to test the
  logic
- tournament_extra_credit_test # Tests the extra credit requirements

