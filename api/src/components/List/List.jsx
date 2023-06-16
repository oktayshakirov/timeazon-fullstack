import React from "react";
import "./List.scss";
import Cover from "../Cover/Cover";
import useFetch from "../../hooks/useFetch";

const List = ({ subCats, maxPrice, sort, catId }) => {
  const sortParam = sort ? `&sort=price:${sort}` : "";
  const { data, loading, error } = useFetch(
    `/products?populate=*&[filters][categories][id]=${catId}${subCats.map(
      (item) => `&[filters][sub_categories][id][$eq]=${item}`
    )}&[filters][price][$lte]=${maxPrice}${sortParam}`
  );

  return (
    <div className="list">
      {loading
        ? "loading"
        : data?.map((item) => <Cover item={item} key={item.id} />)}
    </div>
  );
};

export default List;
