import React, { useState, useEffect } from "react";
import "./Categories.scss";
import { Link } from "react-router-dom";

const Categories = () => {
  const [loading, setLoading] = useState(true);

  useEffect(() => {
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
        <div className="loader"></div>
      ) : (
        <>
          <div className="box">
            <img src="/Categories/men.jpg" alt="Men" />
            <button>
              <Link className="link" to="/products/3">
                Men
              </Link>
            </button>
          </div>
          <div className="box">
            <img src="/Categories/women.jpg" alt="Women" />
            <button>
              <Link className="link" to="/products/4">
                Women
              </Link>
            </button>
          </div>
          <div className="box">
            <img src="/Categories/kids.jpg" alt="Kids" />
            <button>
              <Link className="link" to="/products/5">
                Kids
              </Link>
            </button>
          </div>
          <div className="box">
            <img src="/Categories/smart.jpg" alt="Smart" />
            <button>
              <Link className="link" to="/products/6">
                Smart
              </Link>
            </button>
          </div>
        </>
      )}
    </div>
  );
};

export default Categories;
