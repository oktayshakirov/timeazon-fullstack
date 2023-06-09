import React from "react";
import "./Featured.scss";
import Cover from "../Cover/Cover";
import useFetch from "../../hooks/useFetch";

const Featured = ({ type }) => {
  const { data, loading, error } = useFetch(
    `/products?populate=*&[filters][type][$eq]=${type}`
  );

  return (
    <div className="featured">
      <div className="top">
        <div className="description">
          <h1>{type} products</h1>
          <img src="/Images/superdeals.png" />
        </div>
      </div>
      <div className="bottom">
        {error
          ? "Something went wrong! Please try again!"
          : loading
          ? "The website is currently loading the database. Please wait..."
          : data?.map((item) => <Cover item={item} key={item.id} />)}
      </div>
    </div>
  );
};

export default Featured;
