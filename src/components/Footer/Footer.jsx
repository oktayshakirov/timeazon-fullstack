import React from "react";
import "./Footer.scss";

const Footer = () => {
  return (
    <div className="footer">
      <div className="top">
        <div className="item">
          <h1>Categories</h1>
          <span>Category 1</span>
          <span>Category 2</span>
          <span>Category 3</span>
          <span>Best Sellers</span>
          <span>New Products</span>
        </div>
        <div className="item">
          <h1>Links</h1>
          <span>FAQ</span>
          <span>Pages</span>
          <span>Link</span>
          <span>Link</span>
          <span>Link</span>
        </div>
        <div className="item">
          <h1>About</h1>
          <span>
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non risus a massa efficitur sagittis. 
          Maecenas semper, dolor vel hendrerit dapibus, est justo viverra elit, a porta odio odio id nisi. 
          Proin aliquam libero vitae mi aliquet congue. 
          Sed ut lectus turpis. Sed euismod cursus dolor, nec vulputate ipsum vulputate at. 
          </span>
        </div>
        <div className="item">
          <h1>Contact</h1>
          <span>
            Berlin, Germany
            </span>
            <span>
            +49 123 456789
          </span>
        </div>
      </div>
      <div className="bottom">
        <div className="left">
          <span className="logo">BLN Shop</span>
          <span className="copyright">
            © Copyright 2023. Oktay Shakirov
          </span>
        </div>
        <div className="right">
          <img src="/Images/payments.png" alt="" />
        </div>
      </div>
    </div>
  );
};

export default Footer;