import React from "react";
import { Provider } from "react-redux";
import { render } from "@testing-library/react";

import Store from "@/lib/redux/Store";
import getFullFilename from "@/lib/utils/getFullFilename";

import Settings from "./index";

describe(getFullFilename(__filename), () => {
  describe("The Settings Form", () => {
    it("displays a form", () => {
      const { getByRole } = render(
        <Provider store={Store}>
          <Settings />
        </Provider>
      );

      expect(getByRole("form", { name: "settings-form" })).toBeInTheDocument();
    });

    it("displays a header, three un-checked checkboxes, and a clear button", () => {
      const { getByRole, getByLabelText } = render(
        <Provider store={Store}>
          <Settings />
        </Provider>
      );

      expect(
        getByRole("heading", { level: 2, name: "Settings" })
      ).toBeInTheDocument();

      const catsCheckbox = getByLabelText("I like cats") as HTMLInputElement;
      expect(catsCheckbox.checked).toEqual(false);

      const dogsCheckbox = getByLabelText("I like dogs") as HTMLInputElement;
      expect(dogsCheckbox.checked).toEqual(false);

      const owlsCheckbox = getByLabelText("I like owls") as HTMLInputElement;
      expect(owlsCheckbox.checked).toEqual(false);

      expect(getByRole("button", { name: "Clear" })).toBeInTheDocument();
    });
  });
});
