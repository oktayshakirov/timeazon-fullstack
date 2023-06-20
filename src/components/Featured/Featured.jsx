import React from "react";
import "./Featured.scss";
import Cover from "../Cover/Cover";
import useFetch from "../../hooks/useFetch";
import LocalShippingOutlinedIcon from "@mui/icons-material/LocalShippingOutlined";
import WatchOffOutlinedIcon from "@mui/icons-material/WatchOffOutlined";
import MonetizationOnOutlinedIcon from "@mui/icons-material/MonetizationOnOutlined";
import TrendingUpOutlinedIcon from "@mui/icons-material/TrendingUpOutlined";

const Featured = ({ type }) => {
  const { data, loading, error } = useFetch(
    `/products?populate=*&[filters][type][$eq]=${type}`
  );

  return (
    <div className="featured">
      <div className="top">
        <div className="tab">
          <div className="first-row">
            <h1 className="type">
              <TrendingUpOutlinedIcon /> {type} watches
            </h1>
            <div className="second-row">
              <h4>
                <MonetizationOnOutlinedIcon className="icons" /> Up to 30% Off
              </h4>
              <h4>
                <LocalShippingOutlinedIcon className="icons" /> Free Delivery
              </h4>
              <h4>
                <WatchOffOutlinedIcon className="icons" /> 30-Day Return
              </h4>
            </div>
            <img src="/Images/superdeals.png" className="deals" />
          </div>
        </div>
      </div>
      <div className="bottom">
        {error ? (
          <div className="error-message">
            Oops! Our database where we keep all our watches seems to be down.
            Please try again later ! &#128533;
          </div>
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
