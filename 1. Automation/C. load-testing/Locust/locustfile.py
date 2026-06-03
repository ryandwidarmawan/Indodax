from locust import HttpUser, task, between
from payloads import generate_post_payload
import custom_listener


class JsonPlaceholderUser(HttpUser):

    # jeda antar request
    wait_time = between(1, 2)

    # ====================================
    # GET POSTS
    # ====================================
    @task(3)
    def get_posts(self):

        with self.client.get(
            "/posts",
            name="GET /posts",
            catch_response=True
        ) as response:

            if response.status_code == 200:

                response.success()

            else:

                response.failure(
                    f"Expected 200 but got {response.status_code}"
                )

    # ====================================
    # POST POSTS
    # ====================================
    @task(1)
    def create_post(self):

        payload = generate_post_payload()

        with self.client.post(
            "/posts",
            json=payload,
            name="POST /posts",
            catch_response=True
        ) as response:

            if response.status_code in [200, 201]:

                response.success()

            else:

                response.failure(
                    f"Expected 201 but got {response.status_code}"
                )