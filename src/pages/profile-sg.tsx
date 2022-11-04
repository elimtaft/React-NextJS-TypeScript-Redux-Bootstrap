import Link from "next/link";
import React from "react";

import Layout from "@/components/Layout";
import useUser from "@/lib/auth/useUser";

export default function SgProfile() {
  const { user } = useUser({
    redirectTo: "/login",
  });

  return (
    <Layout>
      <h1>Your profile</h1>
      <h4>
        This page uses{" "}
        <a href="https://nextjs.org/docs/basic-features/pages#static-generation-recommended">
          Static Generation (SG)
        </a>{" "}
        {/* eslint-disable-next-line @next/next/no-html-link-for-pages */}
        and the{" "}
        <Link href="/api/user">
          <a>/api/user</a>
        </Link>{" "}
        route (using <a href="https://github.com/vercel/swr">vercel/SWR</a>)
      </h4>
      {user && (
        <>
          <p className="italic">Your data:</p>
          <pre>{JSON.stringify(user, null, 2)}</pre>
        </>
      )}
    </Layout>
  );
}
