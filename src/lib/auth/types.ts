export interface User {
  isLoggedIn: boolean;
  username: string | null;
  firstName: string | null;
  lastName: string | null;
  createdAt: Date | null;
  updatedAt: Date | null;
}

export interface AuthState {
  isAuthenticated: boolean;
  isLoading: boolean;
  user: User | undefined;
}
