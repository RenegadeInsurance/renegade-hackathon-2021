
const UserGroup = (props) => {


    const users =[{"name" : "JEEVAN RUP ", "location": "Kathmandu"},
        {"name" : "TEST name ", "location": "vht"},
        {"name" : "TEST name ", "location": "vht"}]


    return (
        <div className="bg-drak_blue_background w-80 p-4 rounded-md">
            <div className="flex flex-row justify-between">
                <div className="text-xl mb-4">Group Name</div>
                <div className="text-xl mb-4">{props.group.groupName}</div>
            </div>

            {
                users?.map( user => {
                    return (
                    <div className="flex flex-row space-between justify-between">
                        <div>{user.name}</div>
                        <div>{user.location}</div>
                    </div>
                    )
                })
            }
        </div>
    )
}

export default UserGroup