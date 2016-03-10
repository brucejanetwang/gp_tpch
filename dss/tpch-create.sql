CREATE TABLE PART (

	P_PARTKEY		SERIAL8,
	P_NAME			VARCHAR(55),
	P_MFGR			CHAR(25),
	P_BRAND			CHAR(10),
	P_TYPE			VARCHAR(25),
	P_SIZE			INTEGER8,
	P_CONTAINER		CHAR(10),
	P_RETAILPRICE	FLOAT8,
	P_COMMENT		VARCHAR(23)
);

CREATE TABLE SUPPLIER (
	S_SUPPKEY		SERIAL8,
	S_NAME			CHAR(25),
	S_ADDRESS		VARCHAR(40),
	S_NATIONKEY		INTEGER8 NOT NULL, -- references N_NATIONKEY
	S_PHONE			CHAR(15),
	S_ACCTBAL		FLOAT8,
	S_COMMENT		VARCHAR(101)
);

CREATE TABLE PARTSUPP (
	PS_PARTKEY		INTEGER8 NOT NULL, -- references P_PARTKEY
	PS_SUPPKEY		INTEGER8 NOT NULL, -- references S_SUPPKEY
	PS_AVAILQTY		INTEGER8,
	PS_SUPPLYCOST	FLOAT8,
	PS_COMMENT		VARCHAR(199)
);

CREATE TABLE CUSTOMER (
	C_CUSTKEY		SERIAL8,
	C_NAME			VARCHAR(25),
	C_ADDRESS		VARCHAR(40),
	C_NATIONKEY		INTEGER8 NOT NULL, -- references N_NATIONKEY
	C_PHONE			CHAR(15),
	C_ACCTBAL		FLOAT8,
	C_MKTSEGMENT	CHAR(10),
	C_COMMENT		VARCHAR(117)
);

CREATE TABLE ORDERS (
	O_ORDERKEY		SERIAL8,
	O_CUSTKEY		INTEGER8 NOT NULL, -- references C_CUSTKEY
	O_ORDERSTATUS	CHAR(1),
	O_TOTALPRICE	FLOAT8,
	O_ORDERDATE		DATE,
	O_ORDERPRIORITY	CHAR(15),
	O_CLERK			CHAR(15),
	O_SHIPPRIORITY	INTEGER8,
	O_COMMENT		VARCHAR(79)
);

CREATE TABLE LINEITEM (
	L_ORDERKEY		INTEGER8 NOT NULL, -- references O_ORDERKEY
	L_PARTKEY		INTEGER8 NOT NULL, -- references P_PARTKEY (compound fk to PARTSUPP)
	L_SUPPKEY		INTEGER8 NOT NULL, -- references S_SUPPKEY (compound fk to PARTSUPP)
	L_LINENUMBER	INTEGER8,
	L_QUANTITY		FLOAT8,
	L_EXTENDEDPRICE	FLOAT8,
	L_DISCOUNT		FLOAT8,
	L_TAX			FLOAT8,
	L_RETURNFLAG	CHAR(1),
	L_LINESTATUS	CHAR(1),
	L_SHIPDATE		DATE,
	L_COMMITDATE	DATE,
	L_RECEIPTDATE	DATE,
	L_SHIPINSTRUCT	CHAR(25),
	L_SHIPMODE		CHAR(10),
	L_COMMENT		VARCHAR(44)
);

CREATE TABLE NATION (
	N_NATIONKEY		SERIAL8,
	N_NAME			CHAR(25),
	N_REGIONKEY		INTEGER8 NOT NULL,  -- references R_REGIONKEY
	N_COMMENT		VARCHAR(152)
);

CREATE TABLE REGION (
	R_REGIONKEY	SERIAL8,
	R_NAME		CHAR(25),
	R_COMMENT	VARCHAR(152)
);
