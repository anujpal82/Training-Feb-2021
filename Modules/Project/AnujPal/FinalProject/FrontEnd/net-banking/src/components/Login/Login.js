import React from "react";
import { useState } from "react";
import "../Login/login.scss";
import ProjectService from "../../Services/LoginService";
import { Navbar } from "../Navbar";
import { IoLogoTwitter } from "react-icons/io";
import {
  AiFillYoutube,
  AiFillLinkedin,
  AiFillFacebook,
  AiFillInstagram,
} from "react-icons/ai";

export const Login = (props) => {
  let tempMessage = "";
  let tempAccountNo = "";
  const [loginData, setLogindata] = useState({ userId: "", pass: "" });

  const handleSubmit = async (e) => {
    e.preventDefault();
    await ProjectService.login(loginData).then(async (res) => {
      console.log(res.data.token);
      localStorage.setItem("Token", res.data.token);
      tempMessage = res.data.message;
      tempAccountNo = res.data.accountNo;
    });
    if (tempMessage === "Invalid userid or Password !!!!!!!!!!!") {
      alert("Invalid userid or Password !!!!!!!!!!!");
    } else {
      alert("You Successfully Login To the system");
      props.history.push(`/Home/${tempAccountNo}`);
    }

    // props.history.push("/Portal");
  };
  const Register = () => {
    props.history.push("/signUp");
  };
  return (
    <>
      <Navbar></Navbar>
      <div className="container col-xl-10 col-xxl-8  ">
        <div className=" row  align-items-center g-lg-5 py-5  ">
          <div className="col-lg-7 text-center text-lg-start ">
            <h1 className="display-4 font-weight-bold lh-1 mb-3 text-center">
              Online Internet Banking Dummy Project
            </h1>
            <p className="col-lg-10 fs-4 ml-5 text-center ">
              Lorem ipsum dolor sit, amet consectetur adipisicing elit.
              Blanditiis natus tempora provident maxime voluptate corrupti,
              molestiae commodi, recusandae earum beatae ullam nulla non sint.
              Nihil fugiat minus praesentium delectus consectetur impedit quas
              ratione dolorum
            </p>
          </div>
          <div className="col-md-10 mx-auto col-lg-5">
            <form className="p-4 p-md-5 border rounded-3 bg-light">
              <div className="form-group-sm mb-3">
                <input
                  type="email"
                  className="form-control"
                  placeholder="Enter User-Id"
                  name="userId"
                  onChange={(e) => {
                    setLogindata({
                      ...loginData,
                      [e.target.name]: e.target.value,
                    });
                  }}
                /> 
        
  

               
              </div>
              <div className="form-group-sm mb-3">
                <input
                  type="password"
                  className="form-control"
                  id="floatingPassword"
                  placeholder="Password"
                  name="pass"
                  onChange={(e) => {
                    setLogindata({
                      ...loginData,
                      [e.target.name]: e.target.value,
                    });
                  }}
                />
                {/* <label for="password">Password</label> */}
              </div>

              <div className="row mt-3">
                <div className="col">
                  {" "}
                  <button
                    className="w-100 btn btn-lg btn-primary"
                    onClick={handleSubmit}
                    type="submit"
                  >
                    Login
                  </button>
                </div>
                <div className="col text-center">
                  {" "}
                  <button
                    className="btn btn-secondary btn-lg w-100 custom"
                    onClick={Register}
                  >
                    Register
                  </button>
                </div>
              </div>

              <hr className="my-4" />
              <small className="text-muted">
                By clicking Sign up, you agree to the terms of use.
              </small>
            </form>
          </div>
        </div>
      </div>
      <article className="" id="exclusiveOffers">
        <h3 className="text-center mx-auto mt-3">
          <span> Connect With Us </span>
        </h3>
        <div>
          <div className="row text-center mt-3 bg-light">
            <div className="col " style={{ float: "left" }}>
              <span className="h1  instagram">
                <AiFillInstagram />
              </span>
              <br></br>
              <span className=" instagram h5 mt-4 ml-0">Instagram</span>
            </div>
            <div className="col " style={{ float: "left" }}>
              <span className="h1 facebook">
                <AiFillFacebook />
              </span>
              <br></br>
              <span className=" facebook h4 mt-4 ml-0">Facebook</span>
            </div>
            <div className="col " style={{ float: "left" }}>
              <span className="h1 twitter">
                <IoLogoTwitter />
              </span>
              <br></br>
              <span className=" twitter h4 mt-4 ml-0">Twitter</span>
            </div>
            <div className="col " style={{ float: "left" }}>
              <span className="h1 youTube">
                <AiFillYoutube />
              </span>
              <br></br>
              <span className=" youTube  h4 mt-4 ml-0">YouTube</span>
            </div>
            <div className="col " style={{ float: "left" }}>
              <span className="h1 linkedIn">
                <AiFillLinkedin />
              </span>
              <br></br>
              <span className="  h4 mt-4 ml-0 linkedIn">linkedIn</span>
            </div>
          </div>
        </div>
      </article>
    
    </>
  );
};
