import React from "react";
import "./Cover.scss";
import { Link } from "react-router-dom";

const Cover = ({ item }) => {
  return (
    <Link className="link" to={`/product/${item.id}`}>
      <div className="cover">
        <div className="image">
          {item?.attributes.isNew && <span>New Product</span>}
          <img
            src={
              import.meta.env.VITE_APP_UPLOAD_URL +
              item.attributes?.img?.data?.attributes?.url
            }
            alt=""
            className="mainImg"
          />
          <img
            src={
              import.meta.env.VITE_APP_UPLOAD_URL +
              item.attributes?.img2?.data?.attributes?.url
            }
            alt=""
            className="secondImg"
          />
        </div>
        <h2>{item?.attributes.title}</h2>
        <div className="prices">
          {/* calculate 20% more than the new price */}
          <h3>${(item?.attributes.price * 1.2).toFixed(2)}</h3>
          <h3>${item?.attributes.price}</h3>
        </div>
      </div>
    </Link>
  );
};

export default Cover;
