import React from "react";
import { Provider } from "react-redux";
import { fireEvent, render, waitFor } from "@testing-library/react";

import Store from "@/lib/redux/Store";
import getFullFilename from "@/lib/utils/getFullFilename";

import Login from "./index";

describe(getFullFilename(__filename), () => {
  describe("The <Login>", () => {
    it("displays a Logo and a form", () => {
      const { getByRole } = render(
        <Provider store={Store}>
          <Login />
        </Provider>
      );

      expect(getByRole("form", { name: "login-form" })).toBeInTheDocument();
    });
    it("displays a header, two initially blank fields, and a submit button", () => {
      const { getByRole, getByLabelText } = render(
        <Provider store={Store}>
          <Login />
        </Provider>
      );

      expect(getByLabelText("Username:")).toBeInTheDocument();
      expect(getByLabelText("Username:")).toHaveValue("");

      expect(getByLabelText("Password:")).toBeInTheDocument();
      expect(getByLabelText("Password:")).toHaveValue("");

      expect(getByRole("button", { name: "Login" })).toBeInTheDocument();
    });

    it("displays field errors on the page when they are passed to the component", async () => {
      const { getByLabelText, getByRole, getByText } = render(
        <Provider store={Store}>
          <Login />
        </Provider>
      );

      fireEvent.change(getByLabelText("Username:"), {
        target: { value: "asdf" },
      });
      fireEvent.change(getByLabelText("Password:"), {
        target: { value: "asdf" },
      });

      fireEvent(
        getByRole("button", { name: "Login" }),
        new MouseEvent("click", {
          bubbles: true,
          cancelable: true,
        })
      );

      await waitFor(() => {
        expect(
          getByText(`"username" length must be at least 6 characters long`)
        ).toBeInTheDocument();
      });

      fireEvent.change(getByLabelText("Username:"), {
        target: { value: "asdfasdf" },
      }); // long enough
      fireEvent.change(getByLabelText("Password:"), {
        target: { value: "asdf" },
      }); // This is not

      fireEvent(
        getByRole("button", { name: "Login" }),
        new MouseEvent("click", {
          bubbles: true,
          cancelable: true,
        })
      );

      await waitFor(() => {
        expect(
          getByText(`"password" length must be at least 6 characters long`)
        ).toBeInTheDocument();
      });
    });
  });
});
