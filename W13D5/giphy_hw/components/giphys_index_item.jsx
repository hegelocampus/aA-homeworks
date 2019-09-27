import React from 'react';

export default class GiphysIndex extends React.Component {
  render() {
    let giphy = this.props.giphy;
    return(
      <li>
        <img src={ giphy.images.original.url } />
      </li>
    )
  }
}
