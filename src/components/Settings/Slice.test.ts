import getFullFilename from "@/lib/utils/getFullFilename";

import Slice, {
  initialState,
  resetSettings,
  setCatsPreference,
  setDogsPreference,
  setOwlsPreference,
} from "./Slice";

import { SettingsState } from "./types";

const { reducer } = Slice;

describe(getFullFilename(__filename), () => {
  describe("setCats()", () => {
    it("sets the cats preference to the supplied value", () => {
      const previousState: SettingsState = initialState;
      expect(reducer(previousState, setCatsPreference(true))).toEqual({
        cats: true,
        dogs: false,
        owls: false,
      });
    });
  });

  describe("setDogs()", () => {
    it("sets the dogs preference to the supplied value", () => {
      const previousState: SettingsState = initialState;
      expect(reducer(previousState, setDogsPreference(true))).toEqual({
        cats: false,
        dogs: true,
        owls: false,
      });
    });
  });

  describe("setOwls()", () => {
    it("sets the owls preference to the supplied value", () => {
      const previousState: SettingsState = initialState;
      expect(reducer(previousState, setOwlsPreference(true))).toEqual({
        cats: false,
        dogs: false,
        owls: true,
      });
    });
  });

  describe("resetSettings()", () => {
    it("resets the preferences their initial values", () => {
      const previousState: SettingsState = {
        cats: false,
        dogs: true,
        owls: true,
      };
      expect(reducer(previousState, resetSettings())).toEqual(initialState);
    });
  });
});
