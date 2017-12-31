import React, {Component} from 'react';
import ChannelList from '../containers/channel_list';
import MessageList from '../containers/message_list';

class App extends Component {
  render() {
    return (
      <div className="messaging-wrapper">
        <div className="logo-container">
          <img className="messaging-logo" src="assets/images/logo.png" alt="logo" />
        </div>
        <ChannelList selectChannel={this.props.match.params.channel} />
        <MessageList selectChannel={this.props.match.params.channel} />
      </div>
    );
  }
};

export default App;
