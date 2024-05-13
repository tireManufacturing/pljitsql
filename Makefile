# contrib/pljitsql/Makefile

MODULE_big	= pljitsql

PLJITSQL = pljitsql--1.0.h

OBJS = src/backend/pl_handler.o \
		src/backend/pl_parser/pl_parser.o

EXTENSION = pljitsql
DATA = pljitsql.control pljitsql--1.0.sql
PGFILEDESC = "PL/jitSQL - jit procedural language"

srcdir=`pwd`

# REGRESS
REGRESS = pljitsql_base
pljitsql_regress_dir = $(srcdir)/regress
REGRESS_OPTS = --load-extension=age --inputdir=$(pljitsql_regress_dir) --outputdir=$(pljitsql_regress_dir) --temp-instance=$(pljitsql_regress_dir)/instance --port=3701 --encoding=UTF-8 --temp-config $(pljitsql_regress_dir)/pljitsql_regression.conf

pljitsql_regress_out = instance/ log/ results/ regression.*
EXTRA_CLEAN = $(addprefix $(pljitsql_regress_dir)/, $(pljitsql_regress_out))


# INCLUDE 
pljitsql_include_dir = $(srcdir)/src/include
PG_CPPFLAGS = -I$(pljitsql_include_dir) -I$(pljitsql_include_dir)/pl_parser

# PGXS
PG_CONFIG ?= pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)

# MAKE CMDS