import React, {useEffect, useState} from 'react';
import axios from 'axios';
import {Modal} from "reactstrap";
import Swal from 'sweetalert2'


const Users = ({users, getUser, deleteUser, getUsers, loading, dateDeNaissance}) => {


    const [modal, setModal] = useState(false);
    const toggle = () => setModal(!modal);
    const [nom, setNom] = useState('');
    const [prenom, setPrenom] = useState('');
    const [email, setEmail] = useState('');
    const [adresse, setAdresse] = useState('');
    const [tel, setTel] = useState('');
    const [birthDate, setBirthDate] = useState('');
    const [isSaving, setIsSaving] = useState(false)

    const handleSave = () => {

        let formData = new FormData()
        formData.append("nom", nom)
        formData.append("prenom", prenom)
        formData.append("email", email)
        formData.append("adresse", adresse)
        formData.append("tel", tel)
        formData.append("birthDate", birthDate)
        axios.post('/add_user', formData)
            .then( ()=>{
                setIsSaving(true);
                //console.log(response)
                Swal.fire({
                    icon: 'success',
                    title: 'User saved successfully!',
                    showConfirmButton: false,
                    timer: 1500

                })

                    .then(r => {
                       // (console.log("success"))
                        setIsSaving(false);
                        setNom('')
                        setPrenom('')
                        setEmail('')
                        setAdresse('')
                        setTel('')
                        setBirthDate('')
                        window.location.reload();

                    })

            })
            .catch(function (error) {

                console.log(error)
                Swal.fire({
                    icon: 'error',
                    title: 'An Error Occured!',
                    showConfirmButton: false,
                    timer: 1500
                }).then(r => console.log("Error " + r))
                setIsSaving(false)
            });
    }


    useEffect(() => {
        getUsers()
    }, [])
    return (
        <div>
            <section className="row-section">
                <div className="container">
                    <div className="row text-white">
                        <h2 className="text-center"><span>List of users</span>Created with <i
                            className="fa fa-heart"></i> by yemiwebby</h2>
                    </div>

                    {loading ? (
                        <div className="row">
                            <div className="col text-center m-2">
                                <span className="fa fa-spin fa-spinner fa-4x"></span>
                            </div>
                        </div>
                    ) : (
                        <div className="row bg-white">
                            <table className="table table-stripped">
                                <thead>
                                <tr>
                                    <th>Prenom</th>
                                    <th>Nom</th>
                                    <th>Email</th>
                                    <th>Adresse</th>
                                    <th>Telephone</th>
                                    <th>Birthday</th>
                                </tr>
                                </thead>
                                <tbody>
                                {
                                    users.map((user) =>
                                        <tr className="m-2" key={user.id}>
                                            <td onClick={() => getUser(user.id)}>{user.prenom}</td>
                                            <td onClick={() => getUser(user.id)}>{user.nom}</td>
                                            <td>{user.email}</td>
                                            <td>{user.adresse}</td>
                                            <td>{user.tel}</td>
                                            <td>{dateDeNaissance(user.birthday.timestamp)}</td>
                                            <td>
                                                <a onClick={() => deleteUser(user.id)}
                                                   className="btn btn-outline-danger">Supprimer</a>
                                            </td>
                                        </tr>
                                    )
                                }
                                </tbody>

                            </table>
                            <div className="col text-center mb-4">
                                <button className="btn btn-outline-dark" onClick={toggle}>Add User</button>
                            </div>
                            <Modal isOpen={modal} toggle={toggle}>
                                <div className='modal-header d-flex'>
                                    <h5 className='text-center'>
                                        Ajouter un User
                                    </h5>
                                    <button aria-label='Close' className="text-end btn" type='button' onClick={toggle}>
                        <span className="text-danger"><i className="fa fa-2x fa-window-close" aria-hidden="true"/>
                        </span>
                                    </button>
                                </div>
                                <div className='modal-body'>
                                    <div className='d-flex justify-content-between ml-3'>
                                        <div className="container">
                                            <div className="row">
                                                <form action="" method="post" className="">
                                                    <div className="col-sm-12 mt-2">
                                                        <input
                                                            onChange={(event) => {
                                                                setNom(event.target.value)
                                                            }}
                                                            value={nom}
                                                            type="text"
                                                            className='form-control'
                                                            placeholder='Nom'
                                                        /></div>
                                                    <div className="col-sm-12 my-2">
                                                        <input
                                                            onChange={(event) => {
                                                                setPrenom(event.target.value)
                                                            }}
                                                            value={prenom}
                                                            type="text"
                                                            className='form-control'
                                                            placeholder='Prenom'
                                                        /></div>
                                                    <div className="col-sm-12 my-2">
                                                        <input
                                                            onChange={(event) => {
                                                                setEmail(event.target.value)
                                                            }}
                                                            value={email}
                                                            type="email"
                                                            className='form-control'
                                                            placeholder='exemple@gmail.com'
                                                        /></div>
                                                    <div className="col-sm-12 my-2">
                                                        <input
                                                            onChange={(event) => {
                                                                setAdresse(event.target.value)
                                                            }}
                                                            value={adresse}
                                                            type="text"
                                                            className='form-control'
                                                            placeholder='Adresse'
                                                        /></div>
                                                    <div className="col-sm-12 my-2">
                                                        <input
                                                            onChange={(event) => {
                                                                setTel(event.target.value)
                                                            }}
                                                            value={tel}
                                                            type="tel"
                                                            className='form-control'
                                                            placeholder='Tel'
                                                        /></div>
                                                    <div className="col-sm-12 mt-2 mb-3">
                                                        <input
                                                            onChange={(event) => {
                                                                setBirthDate(event.target.value)
                                                            }}
                                                            value={birthDate}
                                                            type="date"
                                                            className='form-control'
                                                            placeholder='01-01-1990'
                                                        /></div>
                                                    <div className="col-sm-12 mt-2 mb-3 text-center">
                                                        <input type="submit" onClick={handleSave}
                                                               value="Ajouter" className="btn   btn-outline-dark"
                                                               disabled={isSaving}
                                                        />

                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </Modal>
                        </div>

                    )}

                </div>
            </section>
        </div>
    )
}
export default Users;
