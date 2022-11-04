module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', 'ca6684f509f73b9f812c1a67623c80bc'),
  },
});
