import React from "react";
import "./Categories.scss";
import { Link } from "react-router-dom";

const Categories = () => {
  return (
    <div className="categories">
      <div className="box">
        <img src="/Categories/men.jpg" />
        <button>
          <Link className="link" to="/products/3">
            Men
          </Link>
        </button>
      </div>
      <div className="box">
        <img src="/Categories/women.jpg" />
        <button>
          <Link className="link" to="/products/4">
            Women
          </Link>
        </button>
      </div>
      <div className="box">
        <img src="/Categories/kids.jpg" />
        <button>
          <Link className="link" to="/products/5">
            Kids
          </Link>
        </button>
      </div>
      <div className="box">
        <img src="/Categories/smart.jpg" />
        <button>
          <Link className="link" to="/products/6">
            Smart
          </Link>
        </button>
      </div>
    </div>
  );
};

export default Categories;
