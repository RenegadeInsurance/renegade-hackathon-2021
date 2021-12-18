import { useState } from "react"
import Tree from '../utils/TreeNode'


const FloodAssement = () => {

    // const city = "kathmandu "
    // const apiKey = "c5d6b6e3bdff41b10301cec2bd1a5f33"

    // const result = fetch(
    //     "https://api.openweathermap.org/data/2.5/weather?q=" +
    //       city +
    //       "&units=metric&appid=" +
    //       apiKey
    //   )
    //     .then((response) => response.json())
    //     .then((data) => displayWeather(data));


    // function displayWeather(data)
    // {
    //     console.log("response data: ", data)
    // }

    // const StartNode = new Tree("Hello How are you ? ")
    // StartNode.descendants.push(new Tree("Why ?"))
    // StartNode.descendants.push(new Tree("Why Not?"))

    // console.log("strt Node ", StartNode)

    const prediction = 0

    const question = {1: "Question one " }
    const qu = {q: "This is question one ?"}

    const answerOption = ["Yes", "No", "Maybe"]
    


    const [questions, setQuestions] = useState([])
    
    return (
        <>
            <div className="p-4 bg-item_list_bg rounded-lg">
                <h1 className="text-white text-2xl">{qu.q}</h1>
                <div className="flex flex-row space-x-2 mt-4  justify-end">
                {
                    answerOption.map(option => {
                        return (
                            <div >
                                <button className="bg-blue_secondary hover:opacity-70 rounded-lg pl-4 pr-4 pt-2 pb-2">{option}</button>
                            </div>
                        )
                    })
                }
                </div>
            </div>
        </>
    )
}

export default FloodAssement