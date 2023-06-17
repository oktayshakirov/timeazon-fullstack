import React, { useState } from "react";
import KeyboardArrowDownIcon from "@mui/icons-material/KeyboardArrowDown";
import SearchIcon from "@mui/icons-material/Search";
import PersonOutlineOutlinedIcon from "@mui/icons-material/PersonOutlineOutlined";
import FavoriteBorderOutlinedIcon from "@mui/icons-material/FavoriteBorderOutlined";
import ShoppingCartOutlinedIcon from "@mui/icons-material/ShoppingCartOutlined";
import EuroOutlinedIcon from "@mui/icons-material/EuroOutlined";
import WatchOutlinedIcon from "@mui/icons-material/WatchOutlined";
import PublicOutlinedIcon from "@mui/icons-material/PublicOutlined";

import { Link } from "react-router-dom";
import "./Navbar.scss";
import Cart from "../Cart/Cart";
import { useSelector } from "react-redux";

const Navbar = () => {
  const [open, setOpen] = useState(false);
  const products = useSelector((state) => state.cart.products);

  return (
    <div className="navbar">
      <div className="logo-mobile">
        <Link className="link" to="/">
          <img src="/Images/logo.png" />
        </Link>
      </div>
      <div className="wrapper">
        <div className="left">
          <div className="item dropdown">
            <div className="dropdown-header">
              <PublicOutlinedIcon />
              <KeyboardArrowDownIcon />
            </div>
            <div className="dropdown-content">
              <Link className="link" to="/">
                German
              </Link>
              <Link className="link" to="/">
                French
              </Link>
              <Link className="link" to="/">
                English
              </Link>
              <Link className="link" to="/">
                Chinese
              </Link>
              <Link className="link" to="/">
                Japanese
              </Link>
              <Link className="link" to="/">
                Portuguese
              </Link>
              <Link className="link" to="/">
                Italian
              </Link>
              <Link className="link" to="/">
                Spanish
              </Link>
            </div>
          </div>
          <div className="item dropdown">
            <div className="dropdown-header">
              <EuroOutlinedIcon />
              <KeyboardArrowDownIcon />
            </div>
            <div className="dropdown-content">
              <Link className="link" to="/">
                Euro
              </Link>
              <Link className="link" to="/">
                US Dollar
              </Link>
              <Link className="link" to="/">
                British Pound
              </Link>
              <Link className="link" to="/">
                Japanese Yen
              </Link>
              <Link className="link" to="/">
                Chinese Yuan
              </Link>
            </div>
          </div>
          <div className="item dropdown">
            <div className="dropdown-header">
              <WatchOutlinedIcon />
              <KeyboardArrowDownIcon />
            </div>
            <div className="dropdown-content">
              <Link className="link" to="/products/3">
                Men
              </Link>
              <Link className="link" to="/products/4">
                Women
              </Link>
              <Link className="link" to="/products/5">
                Kids
              </Link>
              <Link className="link" to="/products/6">
                Smart
              </Link>
            </div>
          </div>
        </div>
        <div className="center">
          <div className="logo-desktop">
            <Link className="link" to="/">
              <img src="/Images/logo.png" />
            </Link>
          </div>
        </div>
        <div className="right">
          <div className="icons">
            <SearchIcon />
            <PersonOutlineOutlinedIcon />
            <div className="FavIcon">
              <FavoriteBorderOutlinedIcon />
              <span>0</span>
            </div>
            <div className="cartIcon" onClick={() => setOpen(!open)}>
              <ShoppingCartOutlinedIcon />
              <span>{products.length}</span>
            </div>
          </div>
        </div>
      </div>
      {open && <Cart />}
    </div>
  );
};

export default Navbar;
