import { RootState } from "@/lib/redux/Store";

import { SLICE_NAME } from "./constants";
import { SettingsState } from "./types";

const getSettings = (state: RootState): SettingsState => state[SLICE_NAME];
export const isCatsPreferenceSelected = (state: RootState): boolean =>
  getSettings(state).cats;
export const isDogsPreferenceSelected = (state: RootState): boolean =>
  getSettings(state).dogs;
export const isOwlsPreferenceSelected = (state: RootState): boolean =>
  getSettings(state).owls;
