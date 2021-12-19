import { AiFillFileAdd } from "react-icons/ai"
import Modal from "react-modal";
import { useDispatch } from "react-redux";
import uuid from 'react-uuid'


import Form from "./Form";
import { useState } from "react";

import { addNewForm } from "../../redux/slice/formSlice";

const CreateForm = () => {

    const dispatch = useDispatch();

    //modal stuff
    const [modalIsOpen, setModalIsOpen] = useState(false);

    const [newFormError, setNewFormError] = useState(false);

    // for testing only : refactor
    const [formFields, setFormFields] = useState({
        name: "",
        type: "",
        isrequired: null,
        isRiskIndicator: false,
        values: [],
        riskLevel: "",
        riskIf: ""
    })

    // for testing only : refactor
    const [newForm, setNewForm] = useState({
        id: "",
        heading: "",
        fields: []
    })

    // function to handle close modal event
    const closeModal = () => {
        setModalIsOpen(false);
    }

    //new form handler
    const newFormHandler = () => {
        setModalIsOpen(true);
    }

    const handleNewFormChange = (e) => {
        setNewForm({
            ...newForm,
            id: uuid(),
            heading: e.target.value.trim()
        })
    }

    const handleFormSubmit = () => {
        if (newForm.heading.length <= 0) {
            setNewFormError(true);
        } else {
            dispatch(addNewForm(newForm));
            setNewForm({
                id: "",
                heading: "",
                fields: []
            })
            setNewFormError(false);
            setModalIsOpen(false);
        }
    }

    return (
        <>
            <div className="bg-gray-200 min-h-screen py-4">
                <div className="bg-white max-w-7xl mx-auto rounded-xl px-6 py-4">
                    <div className="flex justify-start items-center">
                        <div onClick={() => { newFormHandler() }} className="cursor-pointer flex flex-col items-center border-2 border-gray-800 p-4 rounded-md">
                            <AiFillFileAdd className="h-10 w-10" />
                            <p className="font-heading mt-2">New form</p>
                        </div>
                    </div>
                </div>

                <Form />

            </div>



            {/* modal */}
            <Modal
                className="w-2/4 py-4 mt-12 mx-auto bg-white rounded-3xl text-center font-bold text-xl shadow-xl border-2 border-black"
                isOpen={modalIsOpen}
                onRequestClose={closeModal}
                contentLabel="logout message modal"
                ariaHideApp={false}
            >
                <div className="">
                    <div className="text-2xl text-gray-800 mb-4 font-heading">Add new form:</div>
                    <div className="mt-2">
                        <span className="text-lg">Form Name:</span> <input type="text" value={newForm.formName} onChange={(e) => { handleNewFormChange(e) }} className="border-2 border-black rounded-md" />
                        {newFormError && <p className="text-red-600 text-sm">*Name is required</p>}
                    </div>
                    <div className="mt-4">
                        <button
                            onClick={() => { handleFormSubmit() }}
                            className="mx-1 bg-blue-800 hover:bg-blue-700 text-white tracking-tight font-bold text-xs py-2 px-2 rounded-md"
                        >
                            Add new form
                        </button>
                        <button
                            onClick={() => { setModalIsOpen(false) }}
                            className="mx-1 bg-blue-800 hover:bg-blue-700 text-white tracking-tight font-bold text-xs py-2 px-2 rounded-md"
                        >
                            Cancel
                        </button>
                    </div>
                </div>
            </Modal>
        </>
    )
}

export default CreateForm
