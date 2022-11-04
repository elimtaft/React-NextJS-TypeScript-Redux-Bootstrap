import { AppProps } from "next/app";
import React from "react";
import { Provider } from "react-redux";
import { SWRConfig } from "swr";

import fetchJson from "@/lib/json/fetchJson";
import Store from "@/lib/redux/Store";

import "public/css/global.scss";

function MyApp({ Component, pageProps }: AppProps) {
  return (
    <SWRConfig
      value={{
        fetcher: fetchJson,
        onError: (err) => {
          console.error(err);
        },
      }}
    >
      <Provider store={Store}>
        <Component {...pageProps} />
      </Provider>
    </SWRConfig>
  );
}

export default MyApp;
