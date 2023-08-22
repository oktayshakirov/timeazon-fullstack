import React from "react";
import "./Footer.scss";

const Footer = () => {
  return (
    <div className="footer">
      <div className="top">
        <div className="item">
          <h1>Categories</h1>
          <span>
            <a href="/products/3">Men</a>
          </span>
          <span>
            <a href="/products/4">Women</a>
          </span>
          <span>
            <a href="/products/5">Kids</a>
          </span>
          <span>
            <a href="/products/6">Smart</a>
          </span>
        </div>
        <div className="item">
          <h1>Contact Me</h1>
          <span>
            <a href="https://www.oktayshakirov.com/">Portfolio</a>
          </span>
          <span>
            <a href="https://github.com/oktayshakirov">Github</a>
          </span>
          <span>
            <a href="https://www.linkedin.com/in/oktayshakirov">Linkedin</a>
          </span>
          <span>
            <a href="https://twitter.com/oktayshakirov">Twitter</a>
          </span>
        </div>
        <div className="item">
          <h1>About</h1>
          <span>
            This ecommerce online shop was created as a school project,
            utilizing React.js for the frontend and Strapi for the backend. You
            can find more of my projects in my portfolio, where you can learn
            more about what I do and explore the various projects I have
            undertaken.
          </span>
        </div>
        <div className="item">
          <h1>License</h1>
          <span>
            Permission is granted to freely use, copy, modify, merge, publish,
            distribute, sublicense, and sell the Software, subject to the
            following conditions: include the copyright notice and this
            permission notice in all copies or substantial portions of the
            Software. Translation: You can use this for your project, just
            attribute the source. :)
          </span>
        </div>
      </div>
      <div className="bottom">
        <div className="left">
          <img src="/Images/logo.png" />
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
