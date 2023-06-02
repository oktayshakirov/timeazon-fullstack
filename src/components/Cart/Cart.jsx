import React from "react";
import "./Cart.scss";
import DeleteOutlinedIcon from "@mui/icons-material/DeleteOutlined";

const Cart = () => {
  const data = [
    {
      id: 1,
      img: "/Covers/1.jpg",
      img2: "/Covers/2.jpg",
      title: "Product1",
      description: "Watch Description 1",
      isNew: true,
      oldPrice: 19,
      price: 12,
    },
    {
      id: 2,
      img: "/Covers/1.jpg",
      img2: "/Covers/2.jpg",
      title: "Product2",
      description: "Watch Description 2",
      isNew: true,
      oldPrice: 19,
      price: 12,
    },
  ];
  return (
    <div className="cart">
      <h1>Watches in your cart</h1>
      {data?.map((item) => (
        <div className="item" key={item.id}>
          <img src={item.img} alt="" />
          <div className="details">
            <h1>{item.title}</h1>
            <p>{item.description?.substring(0, 100)}</p>
            <div className="price">1 x ${item.price}</div>
          </div>
          <DeleteOutlinedIcon className="delete" />
        </div>
      ))}
      <div className="total">
        <span>SUBTOTAL</span>
        <span>$24</span>
      </div>
      <button>PAY NOW</button>
      <span className="reset">Reset Cart</span>
    </div>
  );
};

export default Cart;
