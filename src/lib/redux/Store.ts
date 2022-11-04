import { configureStore } from "@reduxjs/toolkit";

import { SLICE_NAME as SETTINGS_SLICE_NAME } from "@/components/Settings/constants";
import SettingsSlice from "@/components/Settings/Slice";

const Store = configureStore({
  reducer: {
    [SETTINGS_SLICE_NAME]: SettingsSlice.reducer,
  },
});

export type RootState = ReturnType<typeof Store.getState>;
export type AppDispatch = typeof Store.dispatch;
export default Store;
