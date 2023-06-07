import React from "react";
import "./Footer.scss";

const Footer = () => {
  return (
    <div className="footer">
      <div className="top">
        <div className="item">
          <h1>Categories</h1>
          <span>Men</span>
          <span>Women</span>
          <span>Kids</span>
          <span>Smart</span>
        </div>
        <div className="item">
          <h1>Links</h1>
          <span>My Portfolio</span>
          <span>Github</span>
          <span>Linkedin</span>
        </div>
        <div className="item">
          <h1>About</h1>
          <span>
            This ecommerce online watch store website was created as a school
            project. Feel free to use it as your own and modify it as you wish.
            Documentation and installation instructions can be found on my
            Github repositories. The website was built with React.js for the
            front end and Strapi for the backend.
          </span>
        </div>
        <div className="item">
          <h1>Contact</h1>
          <span>oktayshakirov@gmail.com</span>
        </div>
      </div>
      <div className="bottom">
        <div className="left">
          <span className="logo">Watch Shop</span>
          <span className="copyright">© Copyright 2023. Oktay Shakirov</span>
        </div>
        <div className="right">
          <img src="/Images/payments.png" alt="" />
        </div>
      </div>
    </div>
  );
};

export default Footer;
