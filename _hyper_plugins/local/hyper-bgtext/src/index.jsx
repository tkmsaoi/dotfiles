const bgtextStyles = {
  zIndex: 20,
  position: "fixed",
  bottom: "6px",
  right: "10px",
  color: "rgba(255, 255, 255, .4)",
  fontSize: "5em",
  overflow: "hidden",
  whiteSpace: "nowrap"
};

exports.middleware = store => next => action => {
  if (action.type === "SESSION_PTY_DATA") {
    const { uid, data } = action;
    const matched = matchData(data);

    if (matched) {
      store.dispatch({
        type: "UPDATE_BGTEXT",
        uid: uid,
        payload: matched
      });
    }
  }

  next(action);
};

function matchData(data) {
  const bgtext = config.getConfig().bgtext;
  if (!bgtext) {
    return null;
  }

  return bgtext.find(x => {
    return x.pattern && x.pattern.test(data);
  });
}

exports.reduceSessions = (state, action) => {
  switch (action.type) {
    case "UPDATE_BGTEXT":
      let sessions = state.sessions;
      let session = sessions[action.uid];
      if (!session) {
        return state;
      }

      sessions = Object.assign({}, sessions, {
        [action.uid]: Object.assign({}, session, { bgtext: action.payload })
      });

      return state.set("sessions", sessions);
    default:
      return state;
  }
};

exports.mapTermsState = (state, map) => {
  const sessions = state.sessions;
  const session = sessions.sessions[sessions.activeUid];

  return Object.assign(map, {
    bgtext: (session && session.bgtext) || {}
  });
};

const passProps = (uid, parentProps, props) => {
  return Object.assign(props, {
    bgtext: parentProps.bgtext
  });
};
exports.getTermGroupProps = passProps;
exports.getTermProps = passProps;

exports.decorateTerm = (Term, { React, notify }) => {
  return class extends React.Component {
    constructor(props, context) {
      super(props, context);
    }

    render() {
      const children = [
        React.createElement(Term, Object.assign({}, this.props))
      ];

      const { bgtext } = this.props;
      if (bgtext) {
        children.unshift(
          <div style={Object.assign({}, bgtextStyles, bgtext.style || {})}>
            {bgtext.text}
          </div>
        );
      }

      return (
        <div
          className="bgtext-container"
          style={{ width: "100%", height: "100%" }}
        >
          {children}
        </div>
      );
    }
  };
};
