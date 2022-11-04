import { createSlice, Draft, PayloadAction } from "@reduxjs/toolkit";

import { SLICE_NAME } from "./constants";
import { SettingsState } from "./types";

export const initialState: SettingsState = {
  cats: false,
  dogs: false,
  owls: false,
};

const Slice = createSlice({
  name: SLICE_NAME,
  initialState,
  reducers: {
    setCatsPreference: (
      state: Draft<typeof initialState>,
      action: PayloadAction<boolean>
    ) => {
      state.cats = action.payload;
    },
    setDogsPreference: (
      state: Draft<typeof initialState>,
      action: PayloadAction<boolean>
    ) => {
      state.dogs = action.payload;
    },
    setOwlsPreference: (
      state: Draft<typeof initialState>,
      action: PayloadAction<boolean>
    ) => {
      state.owls = action.payload;
    },
    resetSettings: (state: Draft<typeof initialState>) => {
      state.cats = false;
      state.dogs = false;
      state.owls = false;
    },
  },
});

export const {
  resetSettings,
  setCatsPreference,
  setDogsPreference,
  setOwlsPreference,
} = Slice.actions;

export default Slice;
