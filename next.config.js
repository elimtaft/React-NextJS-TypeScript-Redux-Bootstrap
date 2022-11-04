/** @type {import('next').NextConfig} */

/*
 * Note: If you use an s3 bucket to store assets for your project, you should
 * include the domain(s) in the 'domains' section below.
 */
module.exports = {
  reactStrictMode: true,
  images: {
    domains: [
      "avatars.githubusercontent.com",
    ],
  },
};
