import React, { useState, useEffect } from "react";
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

  const [showPopup, setShowPopup] = useState(false);

  useEffect(() => {
    let timer;
    if (loading) {
      timer = setTimeout(() => {
        setShowPopup(true);
      }, 5000); // 5 seconds, alert if its still loading
    } else {
      setShowPopup(false);
    }

    return () => {
      clearTimeout(timer);
    };
  }, [loading]);

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
          <>
            <div className="loader-wrapper">
              <div className="loader"></div>
            </div>
            {showPopup && (
              <div className="error-message">
                Hey there! It might take around 60 seconds for the database to
                wake up and load all the watches. Since this is just a demo
                project on a free server, it likes to save resources by going
                into sleep mode when the website hasn't been used for a while. I
                totally get that it can be a bit annoying and really appreciate
                your patience and understanding. Thank you! &#128522;
              </div>
            )}
          </>
        ) : (
          data?.map((item) => <Cover item={item} key={item.id} />)
        )}
      </div>
    </div>
  );
};

export default Featured;
