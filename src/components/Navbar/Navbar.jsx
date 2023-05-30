import React, { useState } from "react";
import KeyboardArrowDownIcon from "@mui/icons-material/KeyboardArrowDown";
import SearchIcon from "@mui/icons-material/Search";
import PersonOutlineOutlinedIcon from "@mui/icons-material/PersonOutlineOutlined";
import FavoriteBorderOutlinedIcon from "@mui/icons-material/FavoriteBorderOutlined";
import ShoppingCartOutlinedIcon from "@mui/icons-material/ShoppingCartOutlined";
import { Link } from "react-router-dom";
import "./Navbar.scss"

const Navbar = () => {
    return (
        <div className="navbar">
        <div className="wrapper">
        <div className="left">
            <div className="item">
            <img src="/img/de.png"/>
            <KeyboardArrowDownIcon/>
        </div>
        <div className="item">
            <span>Euro</span>
            <KeyboardArrowDownIcon/>
        </div>
        <div className="item">
            <Link className ="link" to="/products/1">Category 1</Link>
          </div>
          <div className="item">
            <Link className ="link" to="/products/2">Category 2</Link>
          </div>
          <div className="item">
            <Link className ="link" to="/products/3">Category 3</Link>
          </div>
        </div>
        <div className="center">
          <Link className ="link" to="/">BLN Shop</Link>
        </div>
        <div className="right">
          <div className="item">
            <Link className ="link" to="/">Home</Link>
          </div>
          <div className="item">
            <Link className ="link" to="/">About</Link>
          </div>
          <div className="item">
            <Link className ="link" to="/">Contact</Link>
          </div>
          <div className="icons">
            <SearchIcon/>
            <PersonOutlineOutlinedIcon/>
            <FavoriteBorderOutlinedIcon/>
            <div className="cartIcon">
              <ShoppingCartOutlinedIcon/>
              <span>0</span>
            </div>
        </div>
        </div>
        </div>
    </div>
    )
}

export default Navbar;