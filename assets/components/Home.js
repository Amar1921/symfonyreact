import React, {useEffect, useState} from "react";
import Users from './Users';
import Posts from './Posts';
import {Route} from "react-router-dom";
import {Routes, useNavigate} from "react-router";
import UserInfo from "./UserInfo";
import axios from "axios";


const Home = () => {

    const [user, setUser] = useState([])
    const [loading, setLoading] = useState(true)
    const navigate = useNavigate()
    const [users, setUsers] = useState([])
    const [errorApi, setErrorApi] = useState("")
    const [modal, setModal] = useState(false);
    const toggle = () => setModal(!modal);
    const [idU, setIdU] = useState()

    function getUsers() {
        axios.get(`http://127.0.0.1:8000/api/users`)
            .then((user) => {
                const users = user.data
                // console.log(users[23].birthday.timestamp)
                setUsers(users);
                setLoading(false)
            })
            .catch((error) => {
                setErrorApi("Erreur de connexion a la base de donnees !")
                console.log("Erreur requetes " + error)
            })
    }


    function deleteUser(id) {
        // console.log(id)
        axios.delete(`/api/users/${id}`, {method: 'DELETE'})
            .then((response) => (console.log('Deleted!!!')))
        window.location.reload();
    }

    useEffect(() => {
        getUsers()
    }, [])


    function getUser(id) {
        // console.log(id)
        users.map(user => {

            setIdU(user.id)
            if (user.id === id) {
                setUser(user)
                console.log(user)
                return (
                    navigate(`infos/${user.id}`)
                )
            }
        })
    }

    function dateDeNaissance(t) {
        let date = new Date(t * 1000)
        return date.getDay() + "/" + date.getMonth() + "/" + date.getFullYear();
    }


    return (

        <Routes>
            <Route path="/users" element={<Users users={users}
                                                 deleteUser={deleteUser}
                                                 getUser={getUser}
                                                 getUsers={() => getUsers()}
                                                 loading={loading}
                                                 errorApi={errorApi}
                                                 dateDeNaissance={dateDeNaissance}/>
            }/>
            <Route path={`/infos/${user.id}`} element={<UserInfo user={user}/>}/>
            <Route path="/posts" element={<Posts/>}/>
            <Route path="*" element={<Users users={users}
                                            deleteUser={deleteUser}
                                            getUser={getUser}
                                            getUsers={() => getUsers()}
                                            loading={loading}
                                            errorApi={errorApi}
                                            dateDeNaissance={dateDeNaissance}/>}/>
        </Routes>
    )
}

export default Home;