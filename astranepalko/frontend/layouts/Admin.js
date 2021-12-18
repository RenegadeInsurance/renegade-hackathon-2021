import React from "react"

// component list
import Sidebar from "../components/Sidebar/Sidebar.js"


export default function Admin({children}) {
  return (
    <>
    <p> ADMIN SECTION</p>
    <br/>
    <br/>
    <Sidebar />
    <main>
      {children}
    </main>
    </>
  )
}