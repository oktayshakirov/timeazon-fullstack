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
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum
          non risus a massa efficitur sagittis. Maecenas semper, dolor vel
          hendrerit dapibus, est justo viverra elit, a porta odio odio id nisi.
          Proin aliquam libero vitae mi aliquet congue. Sed ut lectus turpis.
          Sed euismod cursus dolor, nec vulputate ipsum vulputate at.
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
