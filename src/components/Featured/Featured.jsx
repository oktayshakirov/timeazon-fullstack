import React from 'react'
import "./Featured.scss"
import Cover from '../Cover/Cover';

const Featured = ({type}) => {

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
        <div className='featured'>

            <div className="top">
                <h1>{type} products</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non risus a massa efficitur sagittis. 
                  Maecenas semper, dolor vel hendrerit dapibus, est justo viverra elit, a porta odio odio id nisi. 
                  Proin aliquam libero vitae mi aliquet congue. Sed ut lectus turpis. 
                  Sed euismod cursus dolor, nec vulputate ipsum vulputate at.
                </p>
            </div>
            <div className="bottom">
                {data.map(item=>(
                    <Cover item={item} key={item.id}/>
                ))}
            </div>
        </div>
    )
}

export default Featured