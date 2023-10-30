
import React from "react";
import { sprintf } from "sprintf-js";
import { event } from "jquery";
import sleep from "es7-sleep"
import withRouter from "./withRouter.js"
import {Link} from 'react-router-dom'


class List extends React.Component{
	
	constructor(){
		super();
		
		this.init();    //ajax호출, 여기서 호출하면 브라우저에서 안뜨네 그래서 밑에 함수에 넣어야 하는데.....뜬다
		                // 결국은 init의 this.forceUpdate();가 없어서 생긴 문제였지만..정석은 밑의 마운트를 쓰자
	}
	
//	componentDidMount(){       //생성자constructor() 다음에 자동으로 호출되는 함수..React.Component안에 있는 메소드
//		this.init();    //ajax호출... 선생님은 테이릅에 10전에 0이 없는데 나는 있다
//		
//	}
	
	async init(){
		let response = await fetch("/rest/dept");
		let json = await response.json();
		
		
		this.state.data = json.data;
		
		console.log(this.state.data);
		this.forceUpdate();;
		
	}
	
	state = {
		data : []
	}
	
	render(){
		return(
			<>
			 <h1>부서 목록</h1>
			 <hr/>
			 <Link to="/rest/dept/insert">추가</Link>
			 <table border={1}>
			   <thead>
			     <tr>
			       <th>deptno</th>
			       <th>dname</th>
			       <th>loc</th>
			       <th>수정</th>
			       <th>삭제</th>
			     </tr>
			   </thead>
			   <tbody>
			   {
				   this.state.data.map(dept => 
				     <tr key={dept.deptno}>
				       <td>{dept.deptno}</td>
				       <td>{dept.dname}</td>
				       <td>{dept.loc}</td>
				       <td><Link to="/rest/dept/update" state={{dept: dept}}>수정</Link></td>
				       <td><Link to="/rest/dept/delete" state={{dept: dept}}>삭제</Link></td>
				     </tr>
				   )
			   }
			   </tbody>
			 </table>
			</>
		)
	}
}

export default withRouter(List);







