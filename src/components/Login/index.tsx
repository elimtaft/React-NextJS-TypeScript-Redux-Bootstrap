import classNames from "classnames";
import { ValidationError } from "joi";
import React, { FormEvent, useState } from "react";
import { Button, Col, Container, Form, Row } from "react-bootstrap";

import { loginSchema } from "@/lib/auth/loginDTO";
import useUser from "@/lib/auth/useUser";
import fetchJson from "@/lib/json/fetchJson";

import { NAME } from "./constants";
import styles from "./styles.module.scss";

const Login = (): JSX.Element => {
  const { mutateUser } = useUser({
    redirectTo: "/profile-sg",
    redirectIfFound: true,
  });

  const [loginFailed, setLoginFailed] = useState(false);

  const [username, setUsername] = useState("");
  const [usernameError, setUsernameError] = useState("");

  const [password, setPassword] = useState("");
  const [passwordError, setPasswordError] = useState("");

  const handleSubmit = async (event: FormEvent): Promise<void> => {
    event.preventDefault();

    setLoginFailed(false);
    setUsernameError("");
    setPasswordError("");

    // Validate Form
    try {
      await loginSchema.validateAsync({
        username,
        password,
      });
    } catch (error) {
      if (error instanceof ValidationError && "details" in error) {
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        error.details.forEach((item: any) => {
          if (item.path[0] === "username") {
            setUsernameError(item.message);
          }
          if (item.path[0] === "password") {
            setPasswordError(item.message);
          }
        });
      }
      return;
    }

    // Attempt login
    try {
      mutateUser(
        await fetchJson("/api/login", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ username, password }),
        })
      );
    } catch (error) {
      setLoginFailed(true);
    }
  };

  const usernameOnChange = (e: React.ChangeEvent<HTMLInputElement>): void => {
    setUsername(e.currentTarget.value);
  };

  const passwordOnChange = (e: React.ChangeEvent<HTMLInputElement>): void => {
    setPassword(e.currentTarget.value);
  };

  return (
    <Container className={styles.auth_box}>
      <Row>
        <Col>
          <Form
            aria-label="login-form"
            className={styles.auth_form}
            onSubmit={handleSubmit}
          >
            <h2 className="mb-3">Sign In</h2>

            <Form.Group className="mb-3" controlId="username">
              <Form.Label>Username:</Form.Label>
              <Form.Control
                autoComplete="username"
                className={`${usernameError === "" ? "" : styles.red}`}
                onChange={usernameOnChange}
                placeholder="Enter username"
                required
                type="text"
                value={username}
              />
              <Form.Text
                className={classNames("text-muted", {
                  [styles.input_error as string]: true,
                  [styles.active as string]: usernameError !== "",
                })}
              >
                {usernameError}
              </Form.Text>
            </Form.Group>

            <Form.Group className="mb-3" controlId="formPassword">
              <Form.Label>Password:</Form.Label>
              <Form.Control
                autoComplete="password"
                className={`${passwordError === "" ? "" : styles.red}`}
                onChange={passwordOnChange}
                placeholder="Password"
                required
                type="password"
                value={password}
              />
              <Form.Text
                className={classNames("text-muted", {
                  [styles.input_error as string]: true,
                  [styles.active as string]: passwordError !== "",
                })}
              >
                {passwordError}
              </Form.Text>
            </Form.Group>

            <Button className="mb-3" variant="primary" type="submit">
              Login
            </Button>

            {loginFailed && (
              <p className="text-danger">
                Incorrect username or password. Please try again.
              </p>
            )}
          </Form>
        </Col>
      </Row>
    </Container>
  );
};

Login.displayName = NAME;
export default Login;
