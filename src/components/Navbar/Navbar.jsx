import React, { useState } from "react";
import KeyboardArrowDownIcon from "@mui/icons-material/KeyboardArrowDown";
import SearchIcon from "@mui/icons-material/Search";
import PersonOutlineOutlinedIcon from "@mui/icons-material/PersonOutlineOutlined";
import FavoriteBorderOutlinedIcon from "@mui/icons-material/FavoriteBorderOutlined";
import ShoppingCartOutlinedIcon from "@mui/icons-material/ShoppingCartOutlined";
import HomeIcon from '@mui/icons-material/Home';
import { Link } from "react-router-dom";
import "./Navbar.scss";
import Cart from "../Cart/Cart";
import { useSelector } from "react-redux";

const Navbar = () => {
  const [open, setOpen] = useState(false);
  const products = useSelector((state) => state.cart.products);

  return (
    <div className="navbar">
      <div className="wrapper">
        <div className="left">
          <div className="item">
            <img src="/Images/de.png" />
            <KeyboardArrowDownIcon />
          </div>
          <div className="item">
            <img src="/Images/euro.png" />
            <KeyboardArrowDownIcon />
          </div>
          <div className="item dropdown">
            <div className="dropdown-header">
            <img src="/Images/watch.png" />
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
        <div className="item">
            <Link className="link" to="/">
            <HomeIcon />
            </Link>
          </div>
          </div>
        <div className="right">
          <div className="icons">
            <SearchIcon />
            <PersonOutlineOutlinedIcon />
            <FavoriteBorderOutlinedIcon />
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
