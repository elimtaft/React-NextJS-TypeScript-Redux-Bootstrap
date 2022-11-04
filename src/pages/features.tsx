import React from "react";

import Layout from "@/components/Layout";

export default function Home() {
  return (
    <Layout>
      <h1>Features</h1>
      <p>This project uses:</p>
      <ul>
        <li>React</li>
        <li>Next.js</li>
        <li>Typescript</li>
        <li>Bootstrap</li>
        <li>Redux</li>
        <li>Prisma</li>
        <li>iron-session</li>
      </ul>
      <p>
        See the README.md for how to set up a user so that you can test logging
        in and out, and test the statically-generated vs. server-side generated
        profile pages.
      </p>
    </Layout>
  );
}
