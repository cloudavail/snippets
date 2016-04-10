# Objective
Load configuration from a file specified in get_config.py.

# Running
In root directory of `get_config` run `./get_config.py` and look for the `DATABASE` variable when printed.

# Examining Configuration
The output should be similar to the following:

`cjohnson04:get_config cjohnson$ ./get_config.py 
<Config {'JSON_AS_ASCII': True, 'USE_X_SENDFILE': False, 'SESSION_COOKIE_PATH': None, 'SESSION_COOKIE_DOMAIN': None, 'SESSION_COOKIE_NAME': 'session', 'LOGGER_NAME': '__main__', 'DEBUG': True, 'SECRET_KEY': None, 'MAX_CONTENT_LENGTH': None, 'APPLICATION_ROOT': None, 'SERVER_NAME': None, 'DATABASE': 'localhost', 'PREFERRED_URL_SCHEME': 'http', 'JSONIFY_PRETTYPRINT_REGULAR': True, 'TESTING': False, 'PERMANENT_SESSION_LIFETIME': datetime.timedelta(31), 'PROPAGATE_EXCEPTIONS': None, 'TRAP_BAD_REQUEST_ERRORS': False, 'JSON_SORT_KEYS': True, 'SESSION_COOKIE_HTTPONLY': True, 'SEND_FILE_MAX_AGE_DEFAULT': 43200, 'PRESERVE_CONTEXT_ON_EXCEPTION': None, 'SESSION_COOKIE_SECURE': False, 'TRAP_HTTP_EXCEPTIONS': False}>
 * Running on http://127.0.0.1:5000/
`

Notice the value `'DATABASE': 'localhost'`.
