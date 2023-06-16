import React from "react";
import "../Home/Home.scss";
import Slider from "../../components/Slider/Slider";
import Featured from "../../components/Featured/Featured";
import Categories from "../../components/Categories/Categories";
import Contact from "../../components/Contact/Contact";

const Home = () => {
  return (
    <div className="home">
      <Slider />
      <Featured type="featured" />
      <Categories />
      <Featured type="trending" />
      <Contact />
    </div>
  );
};

export default Home;
