import React, { useState, useEffect } from "react";
import EastOutlinedIcon from "@mui/icons-material/EastOutlined";
import WestOutlinedIcon from "@mui/icons-material/WestOutlined";
import "./Slider.scss";

const Slider = () => {
  const [currentSlide, setCurrentSlide] = useState(0);
  const [isLoading, setIsLoading] = useState(true);

  const data = [
    "/Banners/Slider1.jpg",
    "/Banners/Slider2.jpg",
    "/Banners/Slider3.jpg",
  ];

  const prevSlide = () => {
    setCurrentSlide(currentSlide === 0 ? data.length - 1 : (prev) => prev - 1);
  };

  const nextSlide = () => {
    setCurrentSlide(currentSlide === data.length - 1 ? 0 : (prev) => prev + 1);
  };

  useEffect(() => {
    const interval = setInterval(() => {
      nextSlide();
    }, 5000); // 5000 ms = 5 seconds

    return () => clearInterval(interval);
  }, [currentSlide]);

  const handleImageLoad = () => {
    setIsLoading(false);
  };

  return (
    <div className="slider">
      {isLoading && <div className="loader"></div>}
      <div
        className="container"
        style={{ transform: `translateX(-${currentSlide * 100}vw)` }}>
        {data.map((src, index) => (
          <img key={index} src={src} alt="" onLoad={handleImageLoad} />
        ))}
      </div>
      <div className="icons">
        <div className="icon" onClick={prevSlide}>
          <WestOutlinedIcon />
        </div>
        <div className="icon" onClick={nextSlide}>
          <EastOutlinedIcon />
        </div>
      </div>
    </div>
  );
};

export default Slider;
