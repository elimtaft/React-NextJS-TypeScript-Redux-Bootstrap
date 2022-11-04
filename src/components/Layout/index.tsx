import Head from "next/head";
import React from "react";
import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";

import NavBar from "@/components/NavBar";

import { NAME } from "./constants";

export interface componentProps {
  children: React.ReactNode;
}

const Layout = (props: componentProps): JSX.Element => {
  const { children } = props;

  return (
    <>
      <Head>
        <meta
          name="viewport"
          content="width=device-width, initial-scale=1.0"
        ></meta>
        <meta
          name="description"   
          content="Some helpful description of the project here."
        ></meta>               
        <meta 
          name="keywords" 
          content="some, keywords, here"
        ></meta>
        <title>Sample Project</title>
      </Head>

      <main>
        <NavBar />
        <Container className="mt-5">
          <Row>
            <Col>{children}</Col>
          </Row>
        </Container>
      </main>
    </>
  );
};

Layout.displayName = NAME;
export default Layout;
