export const addPrevValues = (log, prevLog = null) => {
	return log.times.map((item, index) => ({
		...item,
		prevComandOne: prevLog ? prevLog.times[index].comandOne : 0,
		prevComandTwo: prevLog ? prevLog.times[index].comandTwo : 0
	}))
}
