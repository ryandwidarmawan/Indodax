from locust import events

@events.request.add_listener
def request_listener(
    request_type,
    name,
    response_time,
    response_length,
    response,
    context,
    exception,
    start_time,
    url,
    **kwargs
):

    if exception:
        print(f"[FAILED] {request_type} {name}")

    else:
        print(
            f"[SUCCESS] {request_type} {name} "
            f"| Status: {response.status_code} "
            f"| Time: {response_time}ms"
        )