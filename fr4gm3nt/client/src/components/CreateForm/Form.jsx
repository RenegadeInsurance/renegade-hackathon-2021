import { useSelector, useDispatch } from 'react-redux';
import {
    Accordion,
    AccordionItem,
    AccordionItemHeading,
    AccordionItemButton,
    AccordionItemPanel,
} from 'react-accessible-accordion';

import { AiFillCaretRight } from "react-icons/ai"
import { deleteForm } from '../../redux/slice/formSlice';

const Form = () => {

    const dispatch = useDispatch();

    const { forms } = useSelector(state => state.formStore)

    const handleDeleteForm = (id) => {
        dispatch(deleteForm(id))
    }


    const individualFormUI = () => {
        return (
            <div>
                <Accordion>
                    {
                        forms.map((form) => (

                            <AccordionItem
                                className="border-2 border-black my-4 rounded-md"
                                key={form.id}>
                                <AccordionItemHeading className="border-b-2 border-black px-2 py-4 rounded-md">
                                    <AccordionItemButton className="font-heading text-gray-800 font-bold flex items-center">
                                        <AiFillCaretRight className="w-4 h-4 mr-2" />
                                        <h1>
                                            {form.heading}
                                        </h1>
                                    </AccordionItemButton>
                                </AccordionItemHeading>

                                <AccordionItemPanel className="px-2 py-4 font-heading text-gray-800">
                                    <div className="rounded-md px-2 py-4">

                                        {
                                            form.fields.length <= 0 ? <p>No fields in this form</p> : <>
                                                {
                                                    form.fields.map((field, i) => (
                                                        <div key={i} className="bg-white border-2 border-black rounded-md my-2 px-2 py-4">
                                                            <div>
                                                                <h1 className="font-heading font-extrabold text-xl">{field.name}</h1>
                                                                {field.type === "input" ? <h1 className="text-lg font-semibold">Type:<span className="text-base ml-1 text-gray-500">input field</span></h1> : ""}
                                                                {field.type === "number" ? <h1 className="text-lg font-semibold">Type:<span className="text-base ml-1 text-gray-500">number field</span></h1> : ""}
                                                                {field.type === "dropdown" ? <h1 className="text-lg font-semibold">Type:<span className="text-base ml-1 text-gray-500">dropdown field</span></h1> : ""}

                                                            </div>

                                                            <div>
                                                                {field.isrequired === true ? <span className="text-red-600 font-heading font-semibold text-base">* required field</span> : <span className="text-green-600 font-heading font-semibold text-base">field not required</span>}
                                                            </div>

                                                            <div>
                                                                {field.isRiskIndicator === true ? <span className="text-red-600 font-heading font-semibold text-base">{field.riskLevel} risk</span> : <span className="text-green-600 font-heading font-semibold text-base">not a risk indicator</span>}
                                                            </div>

                                                            <div>
                                                                <button className="bg-red-700 hover:bg-red-600 text-white tracking-tight text-xs py-2 px-2 rounded-md">delete field</button>
                                                            </div>

                                                        </div>
                                                    ))
                                                }
                                            </>
                                        }


                                    </div>
                                    <div className="flex items-center justify-between">
                                        <div className="mt-4 flex items-center justify-start">
                                            <button className="mx-1 bg-blue-800 hover:bg-blue-700 text-white tracking-tight text-xs py-2 px-2 rounded-md">new input field</button>
                                            <button className="mx-1 bg-blue-800 hover:bg-blue-700 text-white tracking-tight text-xs py-2 px-2 rounded-md">new number field</button>
                                            <button className="mx-1 bg-blue-800 hover:bg-blue-700 text-white tracking-tight text-xs py-2 px-2 rounded-md">new dropdown</button>
                                        </div>
                                        <div className="mt-4 flex items-center justify-start">
                                            <button onClick={() => { handleDeleteForm(form.id) }} className="mx-1 bg-red-700 hover:bg-red-600 text-white tracking-tight text-xs py-2 px-2 rounded-md">delete form</button>
                                            <button className="mx-1 bg-blue-800 hover:bg-blue-700 text-white tracking-tight text-xs py-2 px-2 rounded-md">save</button>
                                        </div>
                                    </div>
                                </AccordionItemPanel>
                            </AccordionItem>

                        ))
                    }
                </Accordion>
            </div>
        )
    }

    return (
        <>
            <div className="bg-gray-200 min-h-screen py-4">
                <div className="bg-white max-w-7xl mx-auto rounded-xl px-6 py-4">
                    <div className="font-heading text-gray-800 text-xl font-extrabold">
                        Forms
                    </div>

                    {individualFormUI()}
                </div>
            </div>
        </>
    )
}

export default Form
