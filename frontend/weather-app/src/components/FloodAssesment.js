import { useEffect, useState } from "react"
import Tree from '../utils/TreeNode'



const FloodAssement = () => {

    const question = [
        {"id": 1, q: "Have you experienced one or more flooding events in your life ?", "y": 2, "n": 3},
        {"id": 2, q: "Has your municipality prepared an emergency plan ?", "y": 4, "n": 5},
        {"id": 3, q: "Do you feel well prepared to face a flooding event ? ", "y":6, "n": 7},
        {"id": 4, q: "Low Risk", "y": null , "n": null},
        {"id": 5, q: "Moderate Risk ", "y":null , "n": null},
        {"id": 6, q: "In your opinion what is the flood risk are where you live ?", "y":8, "n": 9},
        {"id": 7, q: "Do you live near the river ? ", "y":10, "n": 11},
        {"id": 8, q: "Moderate Risk ", "y":null, "n": null},
        {"id": 9, q: "Minimal Risk", "y":null, "n": null},
        {"id": 10, q: "In you opinion what is the flood risk area where you live ?", "y":12, "n": 13},
        {"id": 11, q: "Minimal Risk ", "y":null, "n": null},
        {"id": 12, q: "High Risk", "y":null, "n": null},
        {"id": 13, q: "Moderate Risk ", "y":null, "n": null},
    ]

    const tree = new Tree(question)

    const [showQuestion, setShowQuestion] = useState("")

    const tempNode = tree.node

    const [tNode, setTnode] = useState(tree.node)

    const [predicted, setPredicted] = useState(false)

    const [showRisk, setShowRisk] = useState(false)
    const [risk, setRisk] = useState("")

    
    useEffect(()=> {
        setShowQuestion(tree.node.root.q)
        traverse(tempNode)

    },[])

    const traverse = (node)=> {

        if(node != null)
        {

            console.log("Traversing : " , node)
            traverse(node.left)
            traverse(node.right)
        }


    }

    if(predicted)
    {
        // setTnode(tree.node)
        // setShowQuestion(tree.node.root.q)
        // setShowRisk(true)
    }
  
    

    const yesBtn = ()=>
    {
        // setAns(true)
        // if(tempNode.left.n == null && tempNode.left.y == null)
        // {
        //     return alert(tempNode.left.q)
        // }

        // console.log("left1 ", tempNode.left)
        // setShowQuestion(tempNode.left.q)
        // tempNode = tempNode.left
        // console.log("left2 ", tempNode.left)

        if(tNode.left.n == null && tNode.left.y == null)
        {
            setPredicted(true)
            setRisk(tNode.left.q)
            return alert(tNode.left.q)
        }

        console.log("left1 ", tNode.left)
        setShowQuestion(tNode.left.q)
        setTnode(tNode.left)
        console.log("left2 ", tNode.left)
    }
    
    const noBtn = ()=>
    {
        // // setAns(false)
        // if(tempNode.right.n == null && tempNode.right.y == null)
        // {
        //     alert(tempNode.right.q)
        // }else{
        //     console.log("right1 ", tempNode.right)
        //     setShowQuestion(tempNode.right.q)
        //     tempNode = tempNode.right
        //     console.log("right2 ", tempNode.right)
        // }


        if(tNode.right.n == null && tNode.right.y == null)
        {
            setPredicted(true)
            setRisk(tNode.right.q)
            return alert(tNode.right.q)
        }

        console.log("right1 ", tNode.right)
        setShowQuestion(tNode.right.q)
        setTnode(tNode.right)
        console.log("right2 ", tNode.right)
    }
    
    //showNextQuestion()
    
    return (
        <>
           {showRisk ? (
               <div className="p-4 bg-item_list_bg">
                   <p className="text-2xl">{risk}</p>
               </div>
           ): null}
            <div className="p-4 bg-item_list_bg rounded-lg">
                <h1 className="text-white text-2xl">{showQuestion}</h1>
                <div className="flex flex-row space-x-2 mt-4  justify-end">
                        <div >
                                <button className="bg-blue_secondary hover:opacity-70 rounded-lg pl-4 mr-4 pr-4 pt-2 pb-2 w-32" onClick={() => yesBtn()}>Yes</button>
                                <button className="bg-blue_secondary hover:opacity-70 rounded-lg pl-4 pr-4 pt-2 pb-2 w-32" onClick={noBtn}>No</button>
                         </div>
                </div>
            </div>
        </>
    )
}

export default FloodAssement