import React, { useState, useEffect } from "react";
import axios from "axios";

function Blog() {
  const [posts, setPosts] = useState([]);

  useEffect(() => {
    axios
      .get(`${import.meta.env.VITE_APP_API_URL}/api`)
      .then((response) => {
        setPosts(response.data);
      })
      .catch((error) => {
        console.error("There was an error!", error);
      });
  }, []);

  return (
    <div>
      {posts.map((post) => (
        <div key={post.id}>
          <h2>{post.title}</h2>
          <p>{post.content}</p>
        </div>
      ))}
    </div>
  );
}

export default Blog;
