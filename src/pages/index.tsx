import axios from "axios";
import { InferGetStaticPropsType } from "next";
import React from "react";
import ReactMarkdown from "react-markdown";

import Layout from "@/components/Layout";
import { ArticleData } from "@/lib/strapi/types";

export default function Home({
  data,
}: InferGetStaticPropsType<typeof getStaticProps>) {
  if (data != null) {
    return (
      <Layout>
        <h1>{data.title}</h1>
        <div>
          <ReactMarkdown>{data.content}</ReactMarkdown>
        </div>

        <p>Here&apos;s how the data comes from Strapi:</p>
        <pre>{JSON.stringify(data, null, 2)}</pre>
      </Layout>
    );
  } else {
    return (
      <Layout>
        <h1>Sample Project</h1>
        <p>
          <strong>Note:</strong>You are seeing this because you have not set up
          the Strapi back-end. If you want to play around with Strapi, see the
          README.md for instructions on setting that up.
        </p>
        <p>
          Also see the README.md for how to set up a user so that you can test
          logging in and out, and test the statically-generated vs. server-side
          generated profile pages.
        </p>
      </Layout>
    );
  }
}

export async function getStaticProps() {
  let data: ArticleData = null;

  try {
    const response = await axios.get(
      `${process.env.STRAPI_BACKEND_URL}/api/pages?slug=strapi-sample-homepage-content`,
      {
        headers: {
          Accept: "application/json",
          Authorization: `Bearer ${process.env.STRAPI_API_TOKEN}`,
        },
        timeout: 500,
      }
    );

    data = response.data.data[0].attributes || null;
  } catch (error) {
    if (axios.isAxiosError(error)) {
      console.log("axios error: ", `${error.code}: ${error.message}: ${error.response?.data}`);
    } else {
      console.log("error: ", error);  
    }   
  }

  return {
    props: {
      data,
    },
    revalidate: 60,
  };
}

// export const getStaticPaths: GetStaticPaths<{ slug: string }> = async() => {
//   return {
//     paths: [], // indicates that no page needs to be created at build time
//     fallback: "blocking" // indicates the type of fallback
//   };
// }
