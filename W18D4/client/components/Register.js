import React from 'react';
import { Formik, Form, Field } from 'formik';
import useSession from './useSession';

import Mutations from '../../graphql/mutations';
const { REGISTER } = Mutations;

export default props => {
  const [registerUser] = useSession(REGISTER);

  return (
    <Formik
      initialValues={{
        email: '',
        password: ''
      }}
      onSubmit={ values => registerUser({ variables: values })}
    >
      <Form>
        <label htmlFor="email">email</label>
        <Field name="email" type="email"/>
        <label htmlFor="name">name</label>
        <Field name="name" type="name"/>
        <label htmlFor="password">password</label>
        <Field name="password" type="password"/>
        <button type="submit">Sign up</button>
      </Form>
    </Formik>
  )
}

