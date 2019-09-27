import React from 'react';

import GiphysIndexItem from './giphys_index_item';

export default class GiphysIndex extends React.Component {
  render() {
    let giphys = this.props.giphys;
    let lis = giphys.map(giphy => {
      return (
        <GiphysIndexItem 
          key={giphy.import_datetime} 
          giphy={giphy} />
      )
    });
    return (
      <ul>
        { lis }
      </ul>
    )
  }
}
