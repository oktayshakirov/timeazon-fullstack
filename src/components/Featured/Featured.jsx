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
        <h1>{type} products</h1>
        <p>
          Experience the delight of wearing a watch that not only keeps you
          punctual but also becomes an extension of your personality. Our
          Featured Products embody the highest standards of quality, boasting
          premium materials, impeccable finishes, and cutting-edge technology.
        </p>
      </div>
      <div className="bottom">
        {error
          ? "Something went wrong!"
          : loading
          ? "loading"
          : data?.map((item) => <Cover item={item} key={item.id} />)}
      </div>
    </div>
  );
};

export default Featured;
