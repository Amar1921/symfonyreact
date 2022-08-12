import React from 'react';
import './css/app.css';
import Home from "./components/Home";
import {BrowserRouter, Link} from "react-router-dom";
import { createRoot } from 'react-dom/client';
const container = document.getElementById('root');
const root = createRoot(container); // createRoot(container!) if you use TypeScript
root.render(
    <BrowserRouter>
        <nav className="navbar navbar-expand-lg navbar-dark bg-dark">
            <Link className={"navbar-brand"} to={"/"}> Symfony React Project </Link>
            <div className="collapse navbar-collapse" id="navbarText">
                <ul className="navbar-nav mr-auto">
                    <li className="nav-item">
                        <Link className={"nav-link"} to={"/posts"}> Posts </Link>
                    </li>

                    <li className="nav-item">
                        <Link className={"nav-link"} to={"/users"}> Users </Link>
                    </li>
                </ul>
            </div>
        </nav>

        <Home tab="home" />
    </BrowserRouter>
);

