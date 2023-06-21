import React, { useState, useEffect } from "react";
import "./Categories.scss";
import { Link } from "react-router-dom";

const Categories = () => {
  const [loading, setLoading] = useState(true);

  const handleImageLoad = () => {
    setLoading(false);
  };

  useEffect(() => {
    // Simulating a delay for demonstration purposes
    setTimeout(() => {
      setLoading(false);
    }, 2000);
  }, []);

  return (
    <div className="categories">
      <div className="description">
        <h1>&#8986; Shop by Category: </h1>
      </div>
      {loading ? (
        <div className="loader-wrapper">
          <div className="loader"></div>
        </div>
      ) : (
        <>
          <div className="box">
            <Link to="/products/3">
              <img
                src="/Categories/men.jpg"
                alt="Men"
                onLoad={handleImageLoad}
              />
              <button>Men</button>
            </Link>
          </div>
          <div className="box">
            <Link to="/products/4">
              <img
                src="/Categories/women.jpg"
                alt="Women"
                onLoad={handleImageLoad}
              />
              <button>Women</button>
            </Link>
          </div>
          <div className="box">
            <Link to="/products/5">
              <img
                src="/Categories/kids.jpg"
                alt="Kids"
                onLoad={handleImageLoad}
              />
              <button>Kids</button>
            </Link>
          </div>
          <div className="box">
            <Link to="/products/6">
              <img
                src="/Categories/smart.jpg"
                alt="Smart"
                onLoad={handleImageLoad}
              />
              <button>Smart</button>
            </Link>
          </div>
        </>
      )}
    </div>
  );
};

export default Categories;
