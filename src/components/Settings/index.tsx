import React from "react";
import { Button, Col, Container, Form, Row } from "react-bootstrap";

import { useAppSelector, useAppDispatch } from "@/lib/redux/Hooks";

import * as selectors from "./selectors";

import {
  resetSettings,
  setCatsPreference,
  setDogsPreference,
  setOwlsPreference,
} from "./Slice";

import { NAME } from "./constants";

const Settings = (): JSX.Element => {
  const dispatch = useAppDispatch();
  const cats = useAppSelector(selectors.isCatsPreferenceSelected);
  const dogs = useAppSelector(selectors.isDogsPreferenceSelected);
  const owls = useAppSelector(selectors.isOwlsPreferenceSelected);

  const catsOnChange = (e: React.ChangeEvent<HTMLInputElement>): void => {
    dispatch(setCatsPreference(e.currentTarget.checked));
  };

  const dogsOnChange = (e: React.ChangeEvent<HTMLInputElement>): void => {
    dispatch(setDogsPreference(e.currentTarget.checked));
  };

  const owlsOnChange = (e: React.ChangeEvent<HTMLInputElement>): void => {
    dispatch(setOwlsPreference(e.currentTarget.checked));
  };

  const clearAll = (): void => {
    dispatch(resetSettings());
  };

  return (
    <Container>
      <Row>
        <Col>
          <Form aria-label="settings-form">
            <h2 className="mb-3">Settings</h2>
            <p>This simple form demonstrates how to use Redux.</p>
            <p>
              We use Redux to store things that are needed by the application
              globally.
            </p>
            <p>
              Because of how Next.js supports client-side transitions between
              pages, Redux global state will be preserved between pages unless
              the application is completely refreshed in the browser. To test,
              select some options, and use the navigation bar to visit another
              page, then navigate back to this one. The settings are preserved.
              But if you refresh the page, they are lost.
            </p>
            <p>
              If we need Redux state to be preserved on page refresh, We could
              consider something like{" "}
              <a href="https://www.npmjs.com/package/redux-persist">
                {" "}
                redux-persist{" "}
              </a>
              .
            </p>
            <p>
              In a real-world scenario, we would get these settings from a
              database to populate initially, so refresh wouldn&apos;t really be
              a problem in this case.
            </p>
            <Form.Group className="mb-3" controlId="formBasicCheckbox1">
              <Form.Check
                type="checkbox"
                label="I like cats"
                checked={cats}
                onChange={catsOnChange}
              />
            </Form.Group>
            <Form.Group className="mb-3" controlId="formBasicCheckbox2">
              <Form.Check
                type="checkbox"
                label="I like dogs"
                checked={dogs}
                onChange={dogsOnChange}
              />
            </Form.Group>
            <Form.Group className="mb-3" controlId="formBasicCheckbox3">
              <Form.Check
                type="checkbox"
                label="I like owls"
                checked={owls}
                onChange={owlsOnChange}
              />
            </Form.Group>
            <Button variant="primary" onClick={() => clearAll()}>
              Clear
            </Button>
          </Form>
        </Col>
      </Row>
    </Container>
  );
};

Settings.displayName = NAME;
export default Settings;
