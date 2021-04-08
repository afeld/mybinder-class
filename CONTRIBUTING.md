1. Build and run the container.

   ```sh
   docker build -t mybinder-class .
   docker run --rm -it -p 8888:8888 mybinder-class
   ```

1. Copy the URL starting with `http://127.0.0.1:8888/?token=` into your browser.
