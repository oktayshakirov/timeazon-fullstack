import React from "react";
import "./List.scss";
import Cover from "../Cover/Cover";

const List = () => {
  const data = [
    {
      id: 1,
      img: "/Covers/1.jpg",
      img2: "/Covers/2.jpg",
      title: "Product1",
      isNew: true,
      oldPrice: 19,
      price: 12,
    },
    {
      id: 2,
      img: "/Covers/1.jpg",
      img2: "/Covers/2.jpg",
      title: "Product2",
      isNew: true,
      oldPrice: 19,
      price: 12,
    },
    {
      id: 3,
      img: "/Covers/1.jpg",
      img2: "/Covers/2.jpg",
      title: "Product3",
      isNew: true,
      oldPrice: 19,
      price: 12,
    },
  ];

  return (
    <div className="list">
      {data?.map((item) => (
        <Cover item={item} key={item.id} />
      ))}
    </div>
  );
};

export default List;
