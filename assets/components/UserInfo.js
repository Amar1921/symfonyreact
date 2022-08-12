import React from "react";
import {useNavigate} from "react-router";


const UserInfo = ({user}) => {

    let {prenom, nom, tel, email, adresse, id} = user
    const {timestamp} = user.birthday
    const {type, valeur} = user.possessions

    const navigate = useNavigate()

    function getAge(d) {
        const today = new Date();
        const birthDate = new Date(d);
        let age = today.getFullYear() - birthDate.getFullYear();
        const m = today.getMonth() - birthDate.getMonth();
        if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
            age--;
        }
        return age;
    }

    return (

        <div className="container " style={{background: "white"}}>
            <div className="row mt-4 d-flex justify-content-center">
                <div className="col-sm-10">
                    <table className="table table-tripped">
                        <thead>
                        <tr>
                            <th>Prenom</th>
                            <th>Nom</th>
                            <th>email</th>
                            <th>Telephone</th>
                            <th>Adresse</th>
                        </tr>
                        </thead>


                        <tbody>
                        <tr key={id}>
                            <td>{prenom}</td>
                            <td>{nom}</td>
                            <td>{email}</td>
                            <td>{tel}</td>
                            <td>{adresse}</td>
                            <td>{getAge(timestamp) + " "} ans</td>
                        </tr>
                        </tbody>

                    </table>
                </div>
                <div className="col-sm-10 mt-5 text-center">
                    <h3 className="text-center">Possesions de {prenom}</h3>
                    <table className="table mt-4">
                        <thead>
                        <tr>
                            <th>Nom</th>
                            <th>Type</th>
                            <th>Valeur</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>{user.possessions.nom}</td>
                            <td>{type}</td>
                            <td>{valeur}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div className="col-sm-10 text-center">
                    <button className="btn btn-outline-dark m-5" onClick={() => navigate(`/users`)}>Back to Users
                    </button>
                </div>
            </div>
        </div>
    )
}

export default UserInfo