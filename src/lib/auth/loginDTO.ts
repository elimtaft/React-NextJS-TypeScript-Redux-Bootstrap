import * as Joi from "joi";

export interface LoginDTO {
  username: string;
  password: string;
}

export const loginSchema = Joi.object<LoginDTO>({
  username: Joi.string().alphanum().max(30).min(6).required(),
  password: Joi.string().alphanum().max(30).min(6).required(),
});
