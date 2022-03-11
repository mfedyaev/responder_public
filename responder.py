"""Simple application that responds to HTTP requests."""
import time
from flask import Flask

RESPONDER = Flask(__name__)

@RESPONDER.route("/hello")
def hello():
    """Hello endpoint."""
    return "Hello, Irina!"

@RESPONDER.route('/healthx')
def healthz():
    """K8s Liveness probe healthz."""
    return "OK"

@RESPONDER.route('/healthy')
def healthy():
    """K8s Readiness probe healthy."""
    time.sleep(1)
    return "OK"

# Debug
if __name__ == "__main__":
    RESPONDER.run(host='0.0.0.0', port=8192, debug=True)

# # Production
# if __name__ == "__main__":
#     from waitress import serve
#     serve(RESPONDER, host='0.0.0.0', port=8192)
