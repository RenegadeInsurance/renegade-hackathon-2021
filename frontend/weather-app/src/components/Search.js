import React from "react";
import { VscSearch } from "react-icons/vsc";


const Search = (props) => {

	const inputRef = React.useRef(null)


	const onSubmit = (e) => {
		e.preventDefault()
		if (inputRef.current.value == "") return;
		props.search(inputRef.current.value)
	}

	
	return (
		<>
			<div className="m-auto p-8 w-1/2 text-center">
				<form onSubmit={onSubmit} className="w-full flex flex-row">
					<input
						ref={inputRef}
						type="text"
						className="input w-full h-12 bg-item_list_bg rounded-md border-none"
					></input>
				<VscSearch className="-ml-10 mt-2 text-4xl" onClick={onSubmit}/>
				</form>
			</div>

			<style jsx>
				{`
					.input {
						color: #ffffff;
						padding: 0.2rem;
						padding-left: 1rem;
						-webkit-transition: box-shadow 0.3s;
						transition: box-shadow 0.3s;
					}
					.input:focus {
						outline-offset: 0px;
						outline: none;
						box-shadow: 1px 0.3px 9px 0.1px #111e6c;
					}
				`}
			</style>
		</>
	);
};

export default Search;