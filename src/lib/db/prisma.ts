import { PrismaClient } from "@prisma/client";

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const globalAny: any = global;

const prisma = globalAny.prisma || new PrismaClient();
if (process.env.NODE_ENV === "development") globalAny.prisma = prisma;

export default prisma;
