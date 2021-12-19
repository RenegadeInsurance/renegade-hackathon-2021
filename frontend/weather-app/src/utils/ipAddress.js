
const getIpAddress = async () => {
    let ip
    await fetch("https://api.ipify.org/?format=json").then((res) => res.json()).then((data) => ip = data)
    return ip

}