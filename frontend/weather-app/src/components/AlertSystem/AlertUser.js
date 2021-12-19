import UserGroup from "./UserGroup"
import {MdOutlineGroupAdd} from 'react-icons/md'
import { useState ,Fragment} from "react"

const AlertUser  = () => {

const groupInit = [
  {"groupName" :"group1","groupID": 1},
  {"groupName" :"group2","groupID": 2},
  {"groupName" :"groupn","groupID": 3}]

const [groups, setGroups] = useState(groupInit)

const users = [{"name": "Son ", "id": 1},{"name": "Mon ", "id": 1},{"name": "John ", "id": 1}]

const [toggle, setToggle] = useState(false)

const [newGroupName, setNewGroupName] = useState("")
const [selectedGroupName, setSelectedGroupName] = useState("")
const [selectedUser, setSelectedUser] = useState("")


const onSubmit = () => {

  setToggle(false)
  console.log(newGroupName + selectedGroupName, selectedUser)

  if(newGroupName != "")
  {
    // NEW GROUP CREATION 
    setGroups([...groups, {"groupName": newGroupName, "groupID": 78}])

  }else{
    //EXITing group and user
  }

  setNewGroupName("")
  setSelectedUser("")
  setSelectedGroupName("")
}
const onChange = (e) => {
    if(e.target.name == "userSelect")
    {
      setSelectedUser(e.target.value)
    }

    if(e.target.name == "groupNameSelect")
    {
      setSelectedGroupName(e.target.value)
    }

    if(e.target.name == "newGroupName")
    {
      setNewGroupName(e.target.value)
    }
}


    

const popUpForm = ()=> {
  return (
   <Fragment >
       <div className="w-screen h-full bg-black bg-opacity-70 fixed top-0 left-0" onClick ={()=> {}}>
          {formCreate()}
       </div>
   </Fragment>    
  )
}

const formCreate = () => {
  return (
      <div className="flex flex-row justify-center items-center ">
          <div className="w-1/2 m-auto bg-blue_secondary mt-60 rounded-2xl p-4">
              <form >

                  <div className="mt-4 mb-8">
                  <label className="mr-4 mb-2">Select User </label>
                      <select value={selectedUser} className="bg-slate-900 outline-none p-2 w-1/2 rounded-md" name="userSelect"
                      onChange={onChange}>           
                      {
                      users?.map( user => {

                        return (
                          <option value={user.name}>{user.name}</option>
                        )
                      })
                    }
                  </select>
                  </div>

                  <div className="mt-4 mb-4">
                  <label className="mr-4 mb-2">Select Group </label>
                      <select value={selectedGroupName} className="bg-slate-900 outline-none p-2 w-1/2 rounded-md" name="groupNameSelect"
                      onChange={onChange}>           
                      {
                      groups?.map( group => {

                        return (
                          <option value={group.groupName}>{group.groupName}</option>
                        )
                      })
                    }
                  </select>
                  </div>

                  <div className="mb-8 mt-8">
                    <p className="font-bold text-xl m-2 w-full text-center">OR</p>
                    <div className="w-2/3 border-b-2 opacity-30 text-center m-auto"> </div>
                    <p className="text-xl m-2 w-full text-center">Create New Group </p>
                  </div>

                  <div>
                        <input
                          type= "text"
                          name="newGroupName"
                          placeholder="Enter New Group Name"
                          onChange={onChange}
                          value={ newGroupName}
                          className="bg-transparent w-full h-12 pl-4 border-gray-400 border-2 hover:opacity-70 rounded-md "
                      ></input>
                    </div>
                  

              
              </form>
              <div className="flex flex-row justify-end mt-8 pr-4">
                  <button className="bg-item_list_bg rounded-full pt-2 pb-2 pr-8 pl-8 justify-end items-end" onClick={onSubmit}>ADD</button>
              </div>
          </div>
      </div>    
  )
}

const addClick = ()=> {
  setToggle(true)
}

 return (
  <>
  {toggle? popUpForm(): null}
  <div className="flex flex-row">
  <h1 className = "text-2xl text-white text-center align-middle mr-8"> Add Personal Alert Group </h1>
    <button onClick={addClick} className="w-28 h-10 hover:opacity-60 cursor-pointer bg-color4 rounded-3xl"><MdOutlineGroupAdd className="text-4xl m-auto align-middle"/></button> 
  </div>
  <div className="grid grid-cols-3 gap-14 mt-4 bg-item_list_bg p-4 rounded-lg">
  {
    groups.map(group => {
      return (
        <UserGroup group = {group}/>
        )
    })
  }
  </div>
  </>
  )
}


export default AlertUser