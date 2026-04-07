import requests
import time

def run_http_check(url, timeout=5):
    start = time.time()
    try:
        response = requests.get(url, timeout=timeout)
        elapsed = int((time.time() - start) * 1000)
        status = "healthy" if response.status_code == 200 else "unhealthy"
        return status, elapsed
    except:
        return "unhealthy", 0