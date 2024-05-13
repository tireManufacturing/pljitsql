\echo Use "CREATE EXTENSION pljitsql" to load this file. \quit

CREATE FUNCTION pljitsql_call_handler() RETURNS language_handler
  LANGUAGE c AS 'MODULE_PATHNAME';

-- CREATE FUNCTION pljitsql_inline_handler(internal) RETURNS void
--   STRICT LANGUAGE c AS 'MODULE_PATHNAME';

-- CREATE FUNCTION pljitsql_validator(oid) RETURNS void
--   STRICT LANGUAGE c AS 'MODULE_PATHNAME';

CREATE TRUSTED LANGUAGE pljitsql
  HANDLER plpgsql_call_handler;
--   INLINE plpgsql_inline_handler
--   VALIDATOR plpgsql_validator;

-- The language object, but not the functions, can be owned by a non-superuser.
ALTER LANGUAGE pljitsql OWNER TO @extowner@;

COMMENT ON LANGUAGE pljitsql IS 'PL/jitSQL procedural language';
