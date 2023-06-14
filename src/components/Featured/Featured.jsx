import React from "react";
import "./Featured.scss";
import Cover from "../Cover/Cover";
import useFetch from "../../hooks/useFetch";
import LocalShippingOutlinedIcon from "@mui/icons-material/LocalShippingOutlined";
import WatchOffOutlinedIcon from "@mui/icons-material/WatchOffOutlined";
import MonetizationOnOutlinedIcon from "@mui/icons-material/MonetizationOnOutlined";

const Featured = ({ type }) => {
  const { data, loading, error } = useFetch(
    `/products?populate=*&[filters][type][$eq]=${type}`
  );

  return (
    <div className="featured">
      <div className="top">
        <div className="description">
          <h1>&#128293; {type} products</h1>
          <h4>
            <MonetizationOnOutlinedIcon className="icons" /> Up to 30% Off
          </h4>
          <h4>
            <LocalShippingOutlinedIcon className="icons" /> Free Delivery
          </h4>
          <h4>
            <WatchOffOutlinedIcon className="icons" /> 30-day returning policy
          </h4>
          <img src="/Images/superdeals.png" />
        </div>
      </div>
      <div className="bottom">
        {error ? (
          "The watches couldn't be loaded from the database ! Please try again later!"
        ) : loading ? (
          <div className="loader"></div>
        ) : (
          data?.map((item) => <Cover item={item} key={item.id} />)
        )}
      </div>
    </div>
  );
};

export default Featured;
