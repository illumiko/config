return {
	s(
		"IDB",
		fmt(
			[=[
        const ifExist = (storeName) => {{
            if(!openReq.result.objectStoreNames.contains(storeName)) {{
                openReq.result.createObjectStore(storeName, {{keyPath: "id", autoIncrement:true}})
            }}
        }}
        //init db
        let db
        const openReq = indexedDB.open(`{1}`, 1)
        openReq.onerror = (err) => console.warn(err)
        openReq.onsuccess = (ev) => {{
            console.log('~~{2} DB inited~~')
        }}
        openReq.onupgradeneeded = (ev) => {{
            ifExist(`{2}`)
        }}
      ]=],
			{ i(1), rep(1) }
		)
	),
	s(
		"IDBT",
		fmt(
			[=[
        let tx = openReq.result.transaction(`{1}`, "readwrite").objectStore(`{2}`){}
      ]=],
			{ i(1), rep(1), i(0) }
		)
	),
}
