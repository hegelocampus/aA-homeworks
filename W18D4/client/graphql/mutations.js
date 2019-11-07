import gql from "graphql-tag";

export default {
  // we make sure to use the `mutation` key word when creating our frontend mutations
  // just like we would in GraphiQL
  REGISTER: gql`
    mutation RegisterUser($name: String!, $email: String!, $password: String!) {
      register(name: $name, email: $email, password: $password) {
        email,
        loggedIn,
        token
      }
    }
  `,
  LOGOUT: gql`
    mutation LogoutUser($id: ID) {
      logout(id: $id) {
        id,
        loggedIn,
        token
      }
    }
  `,
  VERIFY_USER: gql`
    mutation VerifyUser($token: String) {
      verifyUser(token: $token) {
        id,
        loggedIn
      }
    }
  `
}

