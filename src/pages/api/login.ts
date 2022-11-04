import bcrypt from "bcryptjs";
import { withIronSessionApiRoute } from "iron-session/next";
import { NextApiRequest, NextApiResponse } from "next";

import { User } from "@/lib/auth/types";
import { sessionOptions } from "@/lib/auth/session";
import prisma from "@/lib/db/prisma";

export default withIronSessionApiRoute(loginRoute, sessionOptions);

async function loginRoute(req: NextApiRequest, res: NextApiResponse) {
  const { username, password } = await req.body;

  try {
    const user = await prisma.user.findUnique({
      rejectOnNotFound: true,
      where: { username },
    });

    if (!user) {
      res.status(401).json({ message: "User not found." });
    } else {
      const isMatch = await bcrypt.compare(password, user?.password || "");

      if (!isMatch) {
        res.status(401).json({ message: "Incorrect password." });
      } else {
        const userData = {
          id: user.id,
          isLoggedIn: true,
          username: user.username,
          firstName: user.firstName,
          lastName: user.lastName,
          createdAt: user.createdAt,
          updatedAt: user.updatedAt,
        } as User;

        req.session.user = userData;
        await req.session.save();
        res.json(userData);
      }
    }
  } catch (error) {
    res.status(500).json({ message: (error as Error).message });
  }
}
