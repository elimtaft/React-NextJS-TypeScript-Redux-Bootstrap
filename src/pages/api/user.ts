import { withIronSessionApiRoute } from "iron-session/next";
import { NextApiRequest, NextApiResponse } from "next";

import { sessionOptions } from "@/lib/auth/session";
import { User } from "@/lib/auth/types";

export default withIronSessionApiRoute(userRoute, sessionOptions);

export const initialState: User = {
  isLoggedIn: false,
  username: null,
  firstName: null,
  lastName: null,
  createdAt: null,
  updatedAt: null,
};

async function userRoute(req: NextApiRequest, res: NextApiResponse<User>) {
  if (req.session.user) {
    res.json({
      ...req.session.user,
      isLoggedIn: true,
    });
  } else {
    res.json(initialState);
  }
}
