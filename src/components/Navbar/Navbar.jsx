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
              <Link className="link" to="/language/1">
                German
              </Link>
              <Link className="link" to="/language/2">
                French
              </Link>
              <Link className="link" to="/language/3">
                English
              </Link>
              <Link className="link" to="/language/4">
                Chinese
              </Link>
              <Link className="link" to="/language/5">
                Japanese
              </Link>
              <Link className="link" to="/language/6">
                Portuguese
              </Link>
              <Link className="link" to="/language/7">
                Italian
              </Link>
              <Link className="link" to="/language/8">
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
              <Link className="link" to="/currency/1">
                Euro
              </Link>
              <Link className="link" to="/currency/2">
                US Dollar
              </Link>
              <Link className="link" to="/currency/3">
                British Pound
              </Link>
              <Link className="link" to="/currency/4">
                Japanese Yen
              </Link>
              <Link className="link" to="/currency/5">
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
