import random

def generate_post_payload():
    return {
        "title": f"title-{random.randint(1,9999)}",
        "body": f"body-{random.randint(1,9999)}",
        "userId": random.randint(1,100)
    }