import React from 'react'
import "./Categories.scss"
import {Link} from "react-router-dom"

const Categories = () => {
    return (
        <div className="categories">
            <div className="column">
            <div className="row">
                <img src="/Categories/1.jpg" />
                <button>
                    <Link className="link" to="/products/1">Sale</Link>
                </button>
            </div>
            <div className="row">
                <img src="/Categories/1.jpg" />
                <button>
                    <Link className="link" to="/products/2">New</Link>
                </button>
            </div>
            </div>
            <div className="column">
            <div className="row">
                <img src="/Categories/1.jpg" />
                <button>
                    <Link className="link" to="/products/3">Category 1</Link>
                </button>
            </div>
            </div>
            <div className="column col-large">
            <div className="row">
            <div className="column">
            <div className="row">
                <img src="/Categories/1.jpg" />
                <button>
                    <Link className="link" to="/products/4">Category 2</Link>
                </button>
            </div>
            </div>
            <div className="column">
            <div className="row">
                <img src="/Categories/1.jpg" />
                <button>
                    <Link className="link" to="/products/5">Category 3</Link>
                </button>
            </div>
            </div>
            </div>
            <div className="row">
                <img src="/Categories/1.jpg" />
                <button>
                    <Link className="link" to="/products/6">Best Sellers</Link>
                </button>
            </div>
            </div>
        </div>
    )
}

export default Categories