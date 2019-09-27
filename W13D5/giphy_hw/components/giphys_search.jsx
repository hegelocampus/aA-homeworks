import React from 'react';
import GiphysIndex from './giphys_index';

export default class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = { searchTerm: "" };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state);
  }

  handleChange(e) {
    e.preventDefault();
    this.setState({ searchTerm: e.target.value });
  }

  render() {
    return (
      <div>
        <form onSubmit={ this.handleSubmit }>
          <input onChange={ this.handleChange } />
          <input type="submit" value="Submit!" />
        </form>
        <GiphysIndex giphys={ this.props.giphys } />
      </div>
    )
  }
}
