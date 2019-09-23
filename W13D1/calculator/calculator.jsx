import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = { num1: "", num2: "" };
    this.setNum1 = this.setNum1.bind(this);
  }

  setNum1(e) {
    this.setState({
  }

  render(){
    return (
      <div>
        <h1>{ this.state.result }</h1>
      </div>
    );
  }
}

export default Calculator;
